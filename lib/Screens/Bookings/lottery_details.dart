import 'dart:convert';

import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/my_lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Utils/Colors.dart';
import 'package:http/http.dart' as http;

class LotteryDetails extends StatefulWidget {
   LotteryDetails({
    Key? key,
     this.gId
  }) : super(key: key);
  String? gId;
  @override
  State<LotteryDetails> createState() => _LotteryDetailsState();
}

class _LotteryDetailsState extends State<LotteryDetails> {
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
         body: Stack(
        children: [
          customDetails(context, ''),
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
              child:myLotteryModel == null ? const Center(child: CircularProgressIndicator()) :myLotteryModel!.data!.lotteries!.isEmpty? Center(child: Text("No Lottery List!!!"))  :SingleChildScrollView(
                child:Container(
                  height: MediaQuery.of(context).size.height/1.1,
                  child: ListView.builder(
                    itemCount:myLotteryModel?.data?.lotteries?.first.lotteryNumbers?.split(',').length,
                      itemBuilder: (context,i){
                      var item =myLotteryModel?.data?.lotteries?.first.lotteryNumbers?.split(',')[i];
                    return  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Lottery Number :"),
                                Text('${item}')
                              ],
                            ),
                          )),
                    );
                  }),
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
  MyLotteryModel? myLotteryModel;

  getLottery() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=4b8b6274f26a280877c08cfedab1d6e9b46e4d2d'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getLotteries'));
    request.body = json.encode({
      "game_id":widget.gId
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
