import 'package:booknplay/Constants.dart';
import 'package:booknplay/Screens/Auth_Views/Otp_Verification/otp_verify_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Routes/routes.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _Otp();
}

class _Otp extends State<OTPVerificationScreen> {
  String? newPin ;
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: OTPVerifyController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child:  Stack(
                children: [
                  customAuthOtp(context, ''),
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
                      child:Padding(
                        padding: const EdgeInsets.only(right:20,left: 20,top: 30),
                        child: Column(
                          children: [
                            const Text('Code has been sent to',style: TextStyle(color: AppColors.primary),),
                            Text(controller.data[0].toString(),style: const TextStyle(fontSize: 20,color: AppColors.primary),),
                            Text('OTP: ${controller.otp}',style: const TextStyle(fontSize: 20,color: AppColors.primary),),
                            const SizedBox(height: 50,),
                            PinCodeTextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                newPin = value.toString();
                              },
                              textStyle: const TextStyle(color: AppColors.primary),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                activeColor: AppColors.primary,
                                inactiveColor: AppColors.primary,
                                fieldHeight: 60,
                                fieldWidth: 60,
                                inactiveFillColor: AppColors.primary,
                                activeFillColor: AppColors.primary,
                              ),
                              //pinBoxRadius:20,
                              appContext: context, length: 4 ,
                            ),

                            const SizedBox(height: 20,),
                            const Text("Haven't received the verification code?",style: TextStyle(color: AppColors.primary,fontSize: 16),),
                            InkWell(onTap: (){
                              controller.sendOtp(mobile: controller.data[0].toString());
                            },
                                child: const Text('Resend',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.primary),)),
                            const SizedBox(height: 50,),
                            // Obx(() => Padding(padding: const EdgeInsets.only(left: 25, right: 25), child: controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) :
                            //
                            // )
                            AppButton(onTap: (){
                              if(newPin == controller.otp){
                                controller.verifyOTP();
                              }else {
                                Fluttertoast.showToast(msg: "Please enter pin");
                              }
                            },title: 'Verify OTP')

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),



            ),


          );
        }
    );
  }



}