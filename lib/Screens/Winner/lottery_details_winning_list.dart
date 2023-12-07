import 'dart:convert';

import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Models/HomeModel/my_lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Utils/Colors.dart';
import 'package:http/http.dart' as http;

class LotteryDetailsWinningList extends StatefulWidget {
   LotteryDetailsWinningList({
    Key? key,
     this.gId
  }) : super(key: key);
  String? gId;
  @override
  State<LotteryDetailsWinningList> createState() => _LotteryDetailsWinningListState();
}

class _LotteryDetailsWinningListState extends State<LotteryDetailsWinningList> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         body: myLotteryModel == null ? Center(child: CircularProgressIndicator()):Stack(
        children: [

          customWinning(context, '${myLotteryModel!.data!.lottery!.gameName}'),
          // customWinning(context, ''),
          Padding(
            // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8.1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xfff6f6f6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  // Top-left corner radius
                  topRight: Radius.circular(30),
                ),
              ),
              child:myLotteryModel == null ? const Center(child: CircularProgressIndicator()) :myLotteryModel!.data!.lottery!.winningPositionHistory!.isEmpty? const Center(child: Text("No Lottery List!!!"))  :SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rank"),
                          Text("Winnings"),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/1.1,
                      child:ListView.separated(
                        itemCount: myLotteryModel!.data!.lottery!.winningPositionHistory!.length,
                        separatorBuilder: ( context,i) => const Divider(),
                        itemBuilder: ( context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Text("Lottery Number :"),
                                        // SizedBox(width: 3,),
                                        Text('# ${myLotteryModel!.data!.lottery!.winningPositionHistory![i].winningPosition}',style: const TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        // Text("Winning Price :"),
                                        // SizedBox(width: 3,),
                                        Text('₹ ${myLotteryModel!.data!.lottery!.winningPositionHistory![i].winnerPrice}',style: const TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )


                    )
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    ));
  }
 String ? Name;

  String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    getLottery();
  }
  LotteryListModel? myLotteryModel;
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
     // Fluttertoast.showToast(msg: "${finalResult.msg}");
      setState(() {
        myLotteryModel = finalResult;
        setState(() {

        });
      });
    } else {
      print(response.reasonPhrase);
    }
  }

}
