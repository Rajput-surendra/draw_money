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
import 'lottery_details_winning_list.dart';

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
          height: 125,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          selectedNumber == null ? Text("Select Lottery No"): Text("Lottery No : ${selectedNumber}",
                              style: TextStyle(color: AppColors.profileColor,fontWeight: FontWeight.bold,fontSize: 20)),
                          const SizedBox(
                            width: 10,
                          ),

                        ],
                      ),
                       Row(
                        children: [
                          lotteryDetailsModel?.data?.lottery?.ticketPrice == null ? Text("Price"): Text(
                            "₹ ${lotteryDetailsModel?.data?.lottery?.ticketPrice}",
                            style: const TextStyle(color: AppColors.profileColor,fontWeight: FontWeight.bold,fontSize: 20),
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
                            Container(
                              color: AppColors.lotteryColor,
                              height: 60,
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(height: 5,),
                                    // InkWell(
                                    //   onTap: (){
                                    //     // Get.toNamed(winnerScreen);
                                    //   },
                                    //   child: getResultModel == null ? Center(child: CircularProgressIndicator()):getResultModel!.data!.lotteries!.length == 0 ? Center(child: Text("No winner list!!")): Container(
                                    //     height: 80,
                                    //     child: ListView.builder(
                                    //         scrollDirection: Axis.horizontal,
                                    //         itemCount:getResultModel!.data!.lotteries!.length,
                                    //         itemBuilder: (BuildContext context, int index) {
                                    //           return  InkWell(
                                    //             onTap: (){
                                    //              // Navigator.push(context, MaterialPageRoute(builder: (context)=>WinnerDetailsScreen(gId: getResultModel!.data!.lotteries![index].gameId,)));
                                    //             },
                                    //             child: Container(
                                    //               height: 50,
                                    //               width: 170,
                                    //               decoration:  const BoxDecoration(
                                    //                 image:  DecorationImage(
                                    //                   image:  AssetImage("assets/images/homewinnerback.png"),
                                    //                   fit: BoxFit.fill,
                                    //                 ),
                                    //               ),
                                    //               child:  Padding(
                                    //                 padding: const EdgeInsets.all(8.0),
                                    //                 child: Column(
                                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                                    //                   children: [
                                    //                     Row(
                                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                       children: [
                                    //                         Column(
                                    //                           crossAxisAlignment: CrossAxisAlignment.start,
                                    //                           children: [
                                    //                             SizedBox(
                                    //                                 width: 90,
                                    //                                 child: Text("${getResultModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.whit,fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                    //                             SizedBox(height: 3,),
                                    //                             //Text("₹${getResultModel!.data!.lotteries![index].winners![0].winnerPrice}",style: TextStyle(color: AppColors.whit),),
                                    //                             SizedBox(height: 3,),
                                    //                             Container(
                                    //                                 width: 90,
                                    //                                 child: Text(getResultModel!.data!.lotteries![index].winners![0].userName??"",style: TextStyle(color: AppColors.whit),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                    //                           ],
                                    //                         ),
                                    //                         ClipRRect(
                                    //                           borderRadius: BorderRadius.circular(10),
                                    //                           child: Container(
                                    //                               height: 40,
                                    //                               width: 40,
                                    //                               child: Image.network("${getResultModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           );
                                    //
                                    //         }
                                    //     ),
                                    //   ),
                                    // ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Winning Drawmoney Price",style: TextStyle(color: AppColors.secondary,fontSize: 18,fontWeight: FontWeight.bold),),
                                        InkWell(
                                          onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LotteryDetailsWinningList(gId:widget.gId ,)));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.secondary,
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            height: 30,
                                            width: 60,
                                            child:

                                            Center(child: Text("View",style: TextStyle(color: AppColors.whit),)),
                                          ),
                                        )

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 120,
                            //   child: ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: lotteryDetailsModel!.data!.lottery!
                            //           .winningPositionHistory!.length,
                            //       // itemCount:2,
                            //       itemBuilder: (context, index) {
                            //         return InkWell(
                            //           onTap: () {
                            //             //Get.toNamed(winnerScreen,arguments:lotteryModel?.data?.lotteries?[index].gameId );
                            //           },
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(5.0),
                            //             child: Container(
                            //               // height: 50,
                            //                 width: 160,
                            //                 decoration: const BoxDecoration(
                            //                     image: DecorationImage(
                            //                         image: AssetImage(
                            //                             "assets/images/winningOrice.png"),
                            //                         fit: BoxFit.fill)),
                            //                 child: Column(
                            //                   children: [
                            //                     const SizedBox(
                            //                       height: 25,
                            //                     ),
                            //                     Padding(
                            //                       padding: const EdgeInsets.only(
                            //                           right: 5),
                            //                       child: Text(
                            //                         "${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winningPosition}",
                            //                         style: const TextStyle(
                            //                             color: AppColors.red,
                            //                             fontWeight:
                            //                             FontWeight.bold),
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       height: 20,
                            //                     ),
                            //                     const Text(
                            //                       "Winner Price ",
                            //                       style: TextStyle(
                            //                           color: AppColors.whit,
                            //                           fontWeight: FontWeight.bold,
                            //                           fontSize: 15),
                            //                     ),
                            //                     Text(
                            //                       "₹${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winnerPrice}",
                            //                       style: const TextStyle(
                            //                           color: AppColors.whit,
                            //                           fontSize: 15,
                            //                           fontWeight: FontWeight.bold),
                            //                     ),
                            //                   ],
                            //                 )),
                            //           ),
                            //         );
                            //       }),
                            // ),
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

                            Container(
                              height: 420 ,
                                width: 100,
                              child: ListWheelScrollView(
                                controller: scrollController,
                                itemExtent: 30,
                                perspective: 0.005,
                                diameterRatio: 1,
                                // offAxisFraction: 1,
                                scrollBehavior: ScrollBehavior(),

                                // Height of each item in the list
                                children: List.generate(
                                  int.parse(ticketNumber?? '0'),
                                      (index) => Container(
                                        decoration: BoxDecoration(
                                            color: selectedNumber == index +1 ? selectedItemColor : Colors.grey,
                                            borderRadius: BorderRadius.circular(10),


                                        ),

                                        height: 50,
                                               child:  Center(
                                                 child: Center(
                                                   child: Text(
                                                     (index + int.parse(startingNumber?? '0')).toString(),
                                                     style: TextStyle(fontSize: 30,color:  AppColors.fntClr),
                                                   ),
                                                 ),
                                               ),
                                  ),
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    selectedNumber = index + int.parse(startingNumber?? '0');
                                    selectedItemColor = AppColors.secondary;
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


  Color selectedItemColor = Colors.blue; //
  void startAutoScroll() {
    const Duration scrollDuration = const Duration(milliseconds: 10);
     Duration pauseDuration =  Duration(seconds: int.parse(time ?? "15"));

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      scrollController.animateToItem(
        scrollController.selectedItem + 1,
        duration: scrollDuration,
        curve: Curves.linear,
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
    print('_____request.body_____${request.body}_________');
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
      print('_____result_____${result}_________');
      final jsonResponse = json.decode(result);
      Fluttertoast.showToast(msg: "${jsonResponse['msg']}");
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
    }
  }







}
