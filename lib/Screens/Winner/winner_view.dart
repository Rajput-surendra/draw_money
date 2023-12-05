import 'dart:async';
import 'dart:convert';

import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/custom_clip_path.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_all_tikit_list.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Models/HomeModel/lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/auth_custom_design.dart';
import '../../Widgets/button.dart';

class WinnerScreen extends StatefulWidget {
  WinnerScreen({Key? key, this.isFrom, this.gId}) : super(key: key);
  final bool? isFrom;
  String? gId;

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  var result = '';

 late FixedExtentScrollController scrollController;
  Timer? timer;



  @override
  void initState() {
    super.initState();

    getLottery();
    scrollController = FixedExtentScrollController();

    startAutoScroll();


  }

  int _counter = 60;
  late Timer _timer;

  int _counter1 = 4;
  late Timer _timer1;

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  bool isFirst = true;
  String? amount ;
  String? purchase;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Use the selectedNumber as needed
        //     if (selectedNumber != null) {
        //       print('Selected Number: $selectedNumber');
        //     }
        //   },
        //   child: Icon(Icons.check),
        // ),
        bottomSheet: Container(
          height: 120,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          selectedNumber == null ? Text("Select Ticket"): Text("Ticket: ${selectedNumber}",
                              style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 10,
                          ),

                        ],
                      ),
                       Row(
                        children: [
                          Text(
                            "₹ ${lotteryDetailsModel?.data?.lottery?.ticketPrice}",
                            style: const TextStyle(color: AppColors.profileColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.fntClr,
                  ),
                  AppButton1(
                    onTap: (){
                      if(selectedNumber == null ){
                       Fluttertoast.showToast(msg: "Please select ticket");
                      }else{
                        buyLotteryApi();
                      }

                    },
                    title: "Buy Now",
                  )
                ],
              )),
        ),
          body: Stack(
            children: [
              customWinner(context, ''),
              Padding(
                // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8.1),
                child:

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color(0xfff6f6f6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      // Top-left corner radius
                      topRight: Radius.circular(30),
                      // Top-right corner radius
                    ),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(right:0,left: 0,top: 0),
                    child:  lotteryDetailsModel?.data?.lottery == null ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       "Timer",
                            //       style: TextStyle(
                            //           color: AppColors.fntClr,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     Card(
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(8.0),
                            //           child: Text("$_counter1 : $_counter"),
                            //         )),
                            //   ],
                            // ),

                            //SizedBox(height: 20,),
                            Container(
                              height: 120,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: lotteryDetailsModel!.data!.lottery!
                                      .winningPositionHistory!.length,
                                  // itemCount:2,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        //Get.toNamed(winnerScreen,arguments:lotteryModel?.data?.lotteries?[index].gameId );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          // height: 50,
                                            width: 160,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/winningOrice.png"),
                                                    fit: BoxFit.fill)),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 5),
                                                  child: Text(
                                                    "${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winningPosition}",
                                                    style: const TextStyle(
                                                        color: AppColors.red,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                const Text(
                                                  "Winner Price ",
                                                  style: TextStyle(
                                                      color: AppColors.whit,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "₹${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winnerPrice}",
                                                  style: const TextStyle(
                                                      color: AppColors.whit,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              color: AppColors.lotteryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Lottery Price",
                                              style: TextStyle(
                                                  color: AppColors.fntClr,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "(₹${lotteryDetailsModel!.data!.lottery!.ticketPrice})",
                                              style: const TextStyle(
                                                  color: AppColors.fntClr,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                "Open: ${lotteryDetailsModel!.data!.lottery!.openTime}"),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                "Close ${lotteryDetailsModel!.data!.lottery!.closeTime}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50,),
                            Container(
                              height: 180,
                                width: 250,
                              child: ListWheelScrollView(
                                controller: scrollController,
                                itemExtent: 30,
                                perspective: 0.01,
                                diameterRatio: 2.5,

                                // Height of each item in the list
                                children: List.generate(
                                  int.parse(ticketNumber?? '0'),
                                      (index) => Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(10)
                                        ),

                                        height: 50,
                                               child:  Center(
                                                 child: Text(
                                                   (index + int.parse(startingNumber?? '0')).toString(),
                                                   style: TextStyle(fontSize: 30,color: AppColors.whit),
                                                 ),
                                               ),
                                  ),
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedNumber = index + int.parse(startingNumber?? '0');
                                    // itemExtent = 30.0 + (selectedNumber! % 30) * 10.0;
                                    print('_____selectedNumber_____${selectedNumber}_________');
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),

            ],
          ),



    )
    );

  }

  void startAutoScroll() {
    const Duration scrollDuration = const Duration(milliseconds: 100);
     Duration pauseDuration =  Duration(seconds: int.parse(time ?? "15"));

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      scrollController.animateToItem(
        scrollController.selectedItem + 1,
        duration: scrollDuration,
        curve: Curves.easeInOut,
      );
    });

   // Uncomment the following lines if you want to stop scrolling after a certain time
    Timer(pauseDuration, () {
      timer?.cancel();
    });
  }

  double itemExtent = 30.0;
  List<int> selectedCardIndexes = [];
  List<String> cardData = [];

  void addTikitList() {
    // for(int i =0; i<cardData.length;i++){
    //   if(i==0){
    //     result = result + cardData[i];
    //   }else{
    //     result = "$result, ${cardData[i]}";
    //  }
    // }
    print(cardData.toString());
  }

  LotteryListModel? lotteryDetailsModel;
  String? userId;

  int? selectedNumber;
 String? time;
  String? startingNumber ;
  String? ticketNumber;
  List<String> numbers = [];

  getLottery() async {
    userId = await SharedPre.getStringValue('userId');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=18afbdd33b04ace40a80944d83e9e23e3ab91c3e'
    };
    var request =
        http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getLottery'));
    request.body = json.encode({"game_id": widget.gId, "user_id": userId});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = LotteryListModel.fromJson(json.decode(result));
      Fluttertoast.showToast(msg: "${finalResult.msg}");
      setState(() {
        lotteryDetailsModel = finalResult;
        setState(() {
         startingNumber = finalResult.data!.lottery!.startNumber.toString();
          ticketNumber = finalResult.data!.lottery!.ticketCount ;
         amount =  finalResult.data!.lottery!.ticketPrice.toString();
         time =  finalResult.data!.lottery!.timer.toString();
   print('_____time_____${time}_________');
        });
      });
    } else {
      print(response.reasonPhrase);
    }
  }
  buyLotteryApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=b573cdbddfc5117759d47585dfc702de3f6f0cc9'
    };
    var request =
        http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/buyLottery'));
    request.body = json.encode({
      "user_id":userId,
      "game_id":widget.gId,
      "amount":amount,
      "lottery_numbers":selectedNumber.toString(),
      "order_number": "2675db01c965",
      "txn_id": "2675db01c965ijbdhgd"
    });
    print('______request.body____${request.body}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      Fluttertoast.showToast(msg: "${jsonResponse['msg']}");
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
    }
  }







}
