import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Signup/signup_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignupController(),
        builder: (controller) =>
           Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        customAuthSignUp(context, ''),
                        Padding(
                          // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3.0),
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
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20,),
                                  const Text("Sign Up",style: TextStyle(color: AppColors.secondary,fontWeight: FontWeight.bold,fontSize: 25),),
                                  const SizedBox(height: 10,),
                                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",style: TextStyle(color: AppColors.subTxtClr,fontWeight: FontWeight.normal,fontSize: 15),),
                               SizedBox(height: 30),
                                  textField(
                                      title: 'User Name',
                                      prefixIcon: Icons.person,
                                      controller: nameController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textField(
                                      title: 'Mobile Number',
                                      prefixIcon: Icons.phone,
                                      inputType: TextInputType.phone,
                                      maxLength: 10,
                                      controller: mobileController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textField1(
                                      title: 'Email Id',
                                      prefixIcon: Icons.email,
                                      inputType: TextInputType.emailAddress,
                                      controller: emailController),

                                  // Text(
                                  //     controller.selectDate(context)!= null
                                  //       ? 'Selected Date: ${DateFormat('yyyy-MM-dd')}'
                                  //       : 'Select a Date',
                                  // ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: 50,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: AppColors.whit,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      readOnly: true,
                                           controller: controller.dobController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.calendar_month),
                                        hintText: "Select DOB"
                                      ),
                                      onTap: (){
                                        controller.selectDate(context);

                                      },
                                    ),
                                  ),

                                 // Text("${controller.currentDate}"),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Obx(
                                        () => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: controller.isLoading.value
                                            ? const Center(
                                          child:
                                          CircularProgressIndicator(),
                                        ): AppButton(
                                          title: 'Sign Up',
                                          onTap: () {
                                            if(mobileController.text.isEmpty && nameController.text.isEmpty && emailController.text.isEmpty && controller.dobController.text.isEmpty) {
                                              Fluttertoast.showToast(msg: "All Fields Required");
                                            } else if(mobileController.text.isEmpty || mobileController.text.length <10 ){
                                              Fluttertoast.showToast(msg: "Please Enter 10 digit number ");
                                            }

                                            else {
                                              controller.registerUser(
                                                  mobile: mobileController.text,
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                   dob: controller.dobController.text
                                              );

                                            }
                                          },
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.fntClr),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed(loginScreen);
                                        },
                                        child: const Text(
                                          'Log In',
                                          style: TextStyle(
                                              color: AppColors.secondary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
         )

        );
  }


}
