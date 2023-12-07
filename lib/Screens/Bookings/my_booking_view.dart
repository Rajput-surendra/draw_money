import 'dart:convert';

import 'package:booknplay/Screens/Bookings/my_booking_controller.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/my_lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import 'package:http/http.dart'as http;

import '../../Widgets/auth_custom_design.dart';
import 'lottery_details.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({Key? key, this.isFrom}) : super(key: key);
final bool? isFrom ;

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    getLottery();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          customLottery(context, ''),

          Padding(
            // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 8.1),
            child: Container(
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
              child: RefreshIndicator(
                onRefresh: (){
                  return Future.delayed(Duration(seconds: 2), () {
                    getLottery();
                  });

                },
                child: SingleChildScrollView(
                  child: Container(
                    //height: MediaQuery.of(context).size.height/1.0,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context,i){
                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        child:myLotteryModel == null ? Center(child: CircularProgressIndicator())  :  myLotteryModel!.data!.lotteries!.isEmpty? Center(child: Text(" No Lottery Found!!")): ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount:myLotteryModel!.data!.lotteries!.length ,
                                            // itemCount:2,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LotteryDetails(gId: myLotteryModel!.data!.lotteries![index].gameId,)));
                                                },
                                                child: InkWell(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Container(
                                                        height: 100,
                                                        decoration: const BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage("assets/images/myLotterybooking.png"), fit: BoxFit.fill)),
                                                        child:  Column(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 5,right: 5),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text("Result Date :",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                      SizedBox(width: 2,),
                                                                      Text("${myLotteryModel!.data!.lotteries![index].resultDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(height: 25,),
                                                                      Text("Result Time:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                      SizedBox(width: 2,),
                                                                      myLotteryModel!.data!.lotteries![index].resultTime == null ? Text("") :   Text("${myLotteryModel!.data!.lotteries![index].resultTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                                    ],
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("${myLotteryModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                      SizedBox(height: 3,),
                                                                      Text("Price : ${myLotteryModel!.data!.lotteries![index].ticketPrice}",style: TextStyle(color: AppColors.whit,fontSize: 18),),
                                                                      SizedBox(height: 3,),
                                                                      Text("Tap To Lottery Number:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    height: 45,width: 50,
                                                                    child: ClipRRect(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        child: Image.network("${myLotteryModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                          ],
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          );
                        }),
                  ),
                ),
              )
            ),
          ),

        ],
      ),



    );


  }

  MyLotteryModel? myLotteryModel;

  getLottery() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=4b8b6274f26a280877c08cfedab1d6e9b46e4d2d'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getLotteries'));
    request.body = json.encode({
      "user_id":userId
    });
    print('_____request.body_____${request.body}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     var result = await response.stream.bytesToString();
     var finalResult = MyLotteryModel.fromJson(jsonDecode(result));
     setState(() {
       myLotteryModel = finalResult;
     });
     Fluttertoast.showToast(msg: "${finalResult.msg}");
    }
    else {
    print(response.reasonPhrase);
    }

  }
}
