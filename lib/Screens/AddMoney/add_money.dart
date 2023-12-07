import 'dart:convert';
import 'dart:io';


import 'package:booknplay/Utils/Colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


import 'dart:ui' as ui;


import '../../Local_Storage/shared_pre.dart';
import '../../Widgets/auth_custom_design.dart';
import '../../Widgets/button.dart';
import 'package:http/http.dart'as http;

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key, }) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    balanceUser();
  }
   String? userBalance,userId;
   balanceUser()  async {
     userBalance = await SharedPre.getStringValue('balanceUser');
     userId = await SharedPre.getStringValue('userId');
     setState(()  {
       getWalletBallace();
     });


   }

   String ? wallet;
   getWalletBallace() async {
     var headers = {
       'Content-Type': 'application/json',
       'Cookie': 'ci_session=dc01298267f1df677d56b79b00289958a862e530'
     };
     var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/lottomoney/Apicontroller/getWalletBalance'));
     request.body = json.encode({
       "user_id":userId
     });
     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       var result = await response.stream.bytesToString();
       var finalResult  = jsonDecode(result);
        setState(() {
          wallet =  finalResult['wallet_balance'];

        });
     }
     else {
     print(response.reasonPhrase);
     }

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          customAddMoney(context, ''),

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
                    //  getLottery();
                    });

                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        showContent()
                      ],
                    )
                  ),
                )
            ),
          ),

        ],
      ),



    );

  }
  StateSetter? dialogState;
  final _formKey = GlobalKey<FormState>();
  TextEditingController  amtC = TextEditingController();
  TextEditingController  msgC = TextEditingController();
  ScrollController controller = new ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  showContent() {
    return SingleChildScrollView(
      controller: controller,
      child:  Column(
          mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: AppColors.primary,
                      ),
                      Text(
                        " " + 'Current Balance',
                        style: TextStyle(color: AppColors.fntClr,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text("₹ ${wallet}" ),
                  SizedBox(height: 10,),
                  AppButton1(
                    onTap: (){
                      _showDialog();
                    },
                    title: "Add Money",
                  )
                ],
              ),
            ),
          ),
        ),

      ]),
    );
  }
  _showDialog() async {
    bool payWarn = false;
    await dialogAnimate(context,
        StatefulBuilder(builder: (BuildContext context, StateSetter setStater) {
          dialogState = setStater;
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 2.0),
                    child: Text( "Add Money",
                      style: TextStyle(color: AppColors.fntClr),
                    ),
                  ),
                  // Divider(color: Theme.of(context).colorScheme.lightBlack),
                  Form(
                    key: _formKey,
                    child: Flexible(
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: AppColors.fntClr,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Amount',
                                        hintStyle: TextStyle(color: AppColors.primary,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: amtC,
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: AppColors.activeBorder,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "Message",
                                        hintStyle: TextStyle(color: AppColors.primary,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: msgC,
                                    )),
                                //Divider(),
                                // Padding(
                                //   padding: EdgeInsets.fromLTRB(20.0, 10, 20.0, 5),
                                //   child: Text(
                                //     "Select Payment Method",
                                //     style: Theme.of(context).textTheme.subtitle2,
                                //   ),
                                // ),
                                Divider(),

                              ])),
                    ),
                  )
                ]),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    'Cancel',
                    style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                        color: AppColors.fntClr,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: Text(
                    'Send',
                    style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                        color: AppColors.fntClr,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                   //openCheckout(amtC.text);
                   })
               ],
            );
        }));
  }
  dialogAnimate(BuildContext context, Widget dialge) {
    return showGeneralDialog(
        barrierColor: AppColors.fntClr,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: dialge),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // pageBuilder: null
        pageBuilder: (context, animation1, animation2) {
          return Container();
        } //as Widget Function(BuildContext, Animation<double>, Animation<double>)
    );
  }
}
