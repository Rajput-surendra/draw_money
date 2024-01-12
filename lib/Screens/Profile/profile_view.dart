import 'dart:convert';

import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Screens/Withdrawal/withdrawal_view.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/custom_clip_path.dart';
import 'package:booknplay/Widgets/button.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_profile_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Widgets/auth_custom_design.dart';
import '../Auth_Views/Login/login_view.dart';
import '../FaQ/faq_view.dart';
import '../My Transaction/transaction_view.dart';
import 'package:http/http.dart'as http;

import 'edit_profile.dart';
class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key, this.isFrom}) : super(key: key);
  final bool? isFrom;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditProfile = false ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    referCode();
  }
  String? mobile,userId,userName,userBalance;
  referCode() async {
    mobile = await SharedPre.getStringValue('userMobile');
    userName = await SharedPre.getStringValue('userData');
    userId = await SharedPre.getStringValue('userId');
    userBalance = await SharedPre.getStringValue('balanceUser');
    setState(() {
      getProfile();
    });
  }
  GetProfileModel? getProfileModel;

  getProfile() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=68b65db8a6659ad0354398bd4cd6449fc10b9b7f'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiGetProfile'));
    request.body = json.encode({
      "user_id": userId.toString()
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var result =  await response.stream.bytesToString();
      var finalResult = GetProfileModel.fromJson(json.decode(result));
      setState(() {
        getProfileModel= finalResult;
      });
     // Fluttertoast.showToast(msg: "${finalResult.msg}");
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body:  Stack(
          children: [
            customProfile(context, ''),
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
                child:bodyWidget(context,),
              ),
            )
          ],
        ),


    )
    );
  }



  Widget bodyWidget(BuildContext context, ) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2),(){
          getProfile();
        });
      },
      child: ListView.builder(
        itemCount: 1,
          itemBuilder: (context,i){
        return  getProfileModel == null || getProfileModel == " " ? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.secondary,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        radius: 1.5,
                        // begin: Alignment.centerLeft,
                        // end: Alignment.centerRight,
                        colors: [
                          AppColors.secondary,
                          AppColors.fntClr.withOpacity(0.5),
                          AppColors.secondary1.withOpacity(0.5)
                        ])),
              ),
              //Text("My Account",style: TextStyle(color: AppColors.whit,fontSize: 20,fontWeight: FontWeight.bold),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(width: 5, color: AppColors.whit),
                        image:  DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${getProfileModel?.profile?.image}"))),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("${getProfileModel?.profile?.userName}",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                      Center(child: Text("${getProfileModel?.profile?.email}",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                      Center(child: Text("${getProfileModel?.profile?.mobile}",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                      Center(child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen(getProfileModel: getProfileModel,)));
                          },
                          child: const Text("Edit Profile",style: TextStyle(color: AppColors.secondary,fontSize: 15,fontWeight: FontWeight.bold),))),
                    ],
                  )

                ],),
              ),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(addMoney);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/Add Money.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("Add Money",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(bookings);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            // border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/My Invitation.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("My Ticket",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WithdrawalScreen()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Withdrawal.png",height: 20,color: AppColors.secondary,),
                                    SizedBox(width: 10,),
                                    Text("Withdrawal",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(invitation);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/My Invitation.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("My Invitation",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionScreen()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/My Transaction.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("My Transaction",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    
                    InkWell(
                      onTap: (){
                        Get.toNamed(privacyScreen);

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/Privacy Policy.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("Privacy Policy",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(termConditionScreen);

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              //border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Image.asset("assets/images/Terms & Conditions.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("Terms and Conditions",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: (){
                        Get.toNamed(faq);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Image.asset("assets/images/FAQ.png",height: 20,color: AppColors.secondary,),
                                    ),
                                    const SizedBox(width: 10,),
                                    const Text("FAQs",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    AppButton1(
                      title: "Logout",
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) {
                            String contentText = "";
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text("Are you sure you want to Logout"),
                                  content: Text(contentText),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () async{
                                        await SharedPre.clear('userId');
                                        await Future.delayed(const Duration(milliseconds: 500));
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                        setState(()  {

                                          //Get.toNamed(loginScreen);
                                        });
                                      },
                                      child: const Text("Logout",),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15,),

                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Invite Friend',
        text: 'Invite Friend',
        linkUrl: 'https://www.youtube.com/watch?v=jqxz7QvdWk8&list=PLjVLYmrlmjGfGLShoW0vVX_tcyT8u1Y3E',
        chooserTitle: 'Invite Friend'
    );
  }
// Function to execute when the user confirms logout
  Widget logOut(context){
    return AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Logout'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget textContainer(IconData icon, String title, String data) {
    return Container(
      height: 90,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.whit,
          border: Border.all(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 0), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            )
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.secondary,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(data,
                  style: const TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget textFieldContainer(
      IconData icon, String title, ProfileController controller, TextEditingController textEditingController) {
    return Column(
      children: [
        textviewRow(title, icon),
        otherTextField(controller: textEditingController),
      ],
    );
  }

  Widget textviewRow(String title, IconData icon) {
    return Row(children: [
      Icon(icon, color: AppColors.secondary,),
      const SizedBox(
        width: 5,
      ),
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
    ]);
  }

  Future showOptions(BuildContext context, ProfileController controller) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              controller.getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              controller.getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
