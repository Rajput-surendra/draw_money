import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/extentions.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) =>
          Scaffold(

            body: Form(
              key: _formkey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child:   SingleChildScrollView(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text("Login",style: TextStyle(color: AppColors.secondary,fontWeight: FontWeight.bold,fontSize: 25),),
                          //("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",style: TextStyle(color: AppColors.subTxtClr,fontWeight: FontWeight.normal,fontSize: 15),),
                          SizedBox(height: 40,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.maxFinite,
                            height: 50,
                            decoration: CustomBoxDecoration.myCustomDecoration(),
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              controller: _mobile,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  hintText: "Mobile Number",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  //  prefixIcon: Icon(Icons.call),
                                  border: InputBorder.none
                              ),
                              style: const TextStyle(fontSize: 14),

                              validator: (val) {

                                if (val!.isEmpty) {
                                  return "Mobile cannot be empty";
                                } else if (val.length < 10) {
                                  return "Please enter mobile must 10 digit";
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 60,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AppButton(
                                title: controller.isLoading == true
                                    ? 'please wait...'
                                    : 'Send OTP', onTap: () {
                              if (_formkey.currentState!.validate()) {
                                controller.sendOtp(mobile: _mobile.text);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please enter mobile number");
                              }
                            }),
                          ),
                        ],),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.fntClr),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed(signupScreen);
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: AppColors.secondary,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )

                  ],),
                )
              ),


            ),
          ),
    );
  }
}
