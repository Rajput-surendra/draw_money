import 'dart:convert';

import 'package:booknplay/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/Get_transaction_model.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import 'package:http/http.dart'as http;

import '../../Widgets/auth_custom_design.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key, this.isFrom,this.gId}) : super(key: key);
  final bool? isFrom;
  String? gId;

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  @override
  void initState() {
    super.initState();
    getUser();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            customTra(context, ''),
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
                  child: SingleChildScrollView(

                    child: getTransactionModel == null ? Center(child: CircularProgressIndicator()): getTransactionModel!.withdrawdata!.length == 0 ? Center(child: Text("Withdraw Trasaction Data Not Available")): SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.1,
                        child: ListView.builder(
                            itemCount: getTransactionModel!.withdrawdata!.length,
                            itemBuilder: (context,i){
                              return   Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${getTransactionModel!.withdrawdata![i].acHolderName}"),
                                          SizedBox(height: 5,),
                                          Text("₹ ${getTransactionModel!.withdrawdata![i].requestAmount}"),
                                          SizedBox(height: 5,),
                                          Text("${getTransactionModel!.withdrawdata![i].requestNumber}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )


                  )
              ),
            ),

          ],
        ),



      )
    ) ;
  }


   String ?userId;
  GetTransactionModel? getTransactionModel;


  get() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=329e84d8baf5bbe6fc18f412bda3e26574156d56'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiUserWithdrawTransactionHistory'));
    request.body = json.encode({
      "user_id":userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result  = await response.stream.bytesToString();
      var finalResult = GetTransactionModel.fromJson(json.decode(result));
       setState(() {
         getTransactionModel =  finalResult;
       });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  getTransactionApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=18afbdd33b04ace40a80944d83e9e23e3ab91c3e'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/apiUserWithdrawTransactionHistory'));
    request.body = json.encode({
      "user_id":userId
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult  =  GetTransactionModel.fromJson(jsonDecode(result));
        Fluttertoast.showToast(msg: "${finalResult.msg}");
      setState(() {
        getTransactionModel = finalResult;

      });
    }
    else {
      print(response.reasonPhrase);
    }

  }
 // String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    // getTransactionApi();
    get();
  }

  // Future<void> getTransactionApi() async {
  //   // isLoading.value = true;
  //   var param = {
  //     'user_id':userId
  //   };
  //   print('__________${param}_________');
  //   apiBaseHelper.postAPICall(getTransactionHistoryAPI, param).then((getData) {
  //     print('____getData______${getData}_________');
  //     String msg = getData['msg'];
  //     getTransactionModel = GetTransactionModel.fromJson(getData);
  //     setState(() {
  //
  //     });
  //     Fluttertoast.showToast(msg: msg);
  //     //isLoading.value = false;
  //   });
  // }

//   String ?userId;
//   getLottery() async {
//     userId = await SharedPre.getStringValue('userId');
//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie': 'ci_session=18afbdd33b04ace40a80944d83e9e23e3ab91c3e'
//     };
//     var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/lottomoney/Apicontroller/getLottery'));
//     request.body = json.encode({
//       "game_id": widget.gId,
//       "user_id": userId
//     });
//     print('_____request.body_____${request.body}_________');
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var result = await response.stream.bytesToString();
//       var finalResult  =  LotteryListModel.fromJson(json.decode(result));
//       Fluttertoast.showToast(msg: "${finalResult.msg}");
//       setState(() {
//         lotteryDetailsModel = finalResult;
//
//       });
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//   }



}
