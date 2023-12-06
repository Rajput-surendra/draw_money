import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Routes/routes.dart';

class SignupController extends AppBaseController {
  RxBool isLoading = false.obs;



  Future<void> registerUser({
    required String mobile,
    required String? email,
    required String? name,
    required String? dob
  }) async {
    isLoading.value = true;

    var param = {
      'userName': name,
      'mobile': mobile,
      'email': email,
      'dob': dob,

    };
    apiBaseHelper.postAPICall(getUserRegister, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];
      if (status) {
        Get.toNamed(otpScreen, arguments: [mobile, getData['otp']]);
        Fluttertoast.showToast(msg: msg);
      } else {
        Fluttertoast.showToast(msg: msg);

      }

      isLoading.value = false;
      dobController.clear();
    });
  }

   DateTime currentDate = DateTime.now();
   DateTime eighteenYearsAgo = DateTime.now().subtract(Duration(days: 365 * 18));

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: eighteenYearsAgo,
    );

    if (picked != null && picked != currentDate) {
      update();
      currentDate = picked;
      dobController.text = currentDate.toString();
     print('_____eighteenYearsAgo_____${currentDate}_________');
    }
  }

  final dobController = TextEditingController();
}
