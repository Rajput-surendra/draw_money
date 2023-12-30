
import 'dart:convert';

import 'package:booknplay/Services/api_services/apiConstants.dart';
import 'package:booknplay/Utils/Colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/Get_result_list_Model.dart';
import '../../Models/HomeModel/get_result_details_model.dart';

import 'package:http/http.dart'as http;

import '../../Widgets/auth_custom_design.dart';
class ResultDetailsScreen extends StatefulWidget {
  ResultDetailsScreen({Key? key, this.isFrom,this.gId}) : super(key: key);
  final bool? isFrom;
  String ? gId;

  @override
  State<ResultDetailsScreen> createState() => _ResultDetailsScreenState();
}

class _ResultDetailsScreenState extends State<ResultDetailsScreen> {
  var result= '';
  @override
  void initState() {
    super.initState();
    // getResultDetails();

    getUser();
  }
  String ?userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    // getTransactionApi();
    getInvatation();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  SafeArea(
        child: Scaffold(
          body:  Stack(
            children: [
              customResultDetails(context, ''),
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
                      padding: const EdgeInsets.only(right:10,left: 10,top: 2),
                      child:  SingleChildScrollView(
                        child: Padding(
                            padding:  EdgeInsets.all(2.0),
                            child:RefreshIndicator(
                              onRefresh: (){
                                return Future.delayed(Duration(seconds: 2), () {
                                  getInvatation();
                                });

                              },
                              child: getResultDetailsModel == null ? Center(child: CircularProgressIndicator()): getResultDetailsModel!.data!.lotteries!.first.result!.isEmpty ? Center(child: Text("No result details")):  SingleChildScrollView(
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height/1.1,
                                      child: ListView.builder(
                                        itemCount:getResultDetailsModel!.data!.lotteries![0].result!.length ,
                                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        //     crossAxisCount: 2,
                                        //   childAspectRatio: 4/1
                                        // ),
                                        itemBuilder: (context,i) {
                                          return Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Winning Range : ${getResultDetailsModel!.data!.lotteries![0].result![i].winningPosition}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold)),
                                                          SizedBox(height: 4,),
                                                          Text(" Price : ₹ ${getResultDetailsModel!.data!.lotteries![0].result![i].winnerPrice}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.w500)),
                                                          SizedBox(height: 4,),

                                                        ],
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 50,
                                                        child: Card(
                                                          elevation: 2,
                                                          child: Center(child: Text("${getResultDetailsModel!.data!.lotteries![0].result![i].lotteryNumber}")),),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                ),
                              )
                            )
                        ),
                      )
                  ),
                ),
              )
            ],
          ),




        ),
      )





    ) ;
  }

  GetResultListModel? getResultDetailsModel;

  getInvatation() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=cefaa9477065503c4ca2ed67af58f3c87c6bfab4'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getResults'));
    request.body = json.encode({
      'game_id':widget.gId,
      'user_id': userId
    });
    print("------Surendra-------${request.body}----------");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetResultListModel.fromJson(json.decode(result));
      setState(() {
        getResultDetailsModel = finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");

    }
    else {
      print(response.reasonPhrase);
    }

  }


}
