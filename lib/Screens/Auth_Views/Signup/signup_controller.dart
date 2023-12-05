import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Routes/routes.dart';

class SignupController extends AppBaseController {
  RxBool isLoading = false.obs;

  late DateTime _selectedDate;

  Future<void> registerUser({
    required String mobile,
    required String? email,
    required String? name}) async {
    isLoading.value = true;

    var param = {
      'userName': name,
      'mobile': mobile,
      'email': email,

    };
    apiBaseHelper.postAPICall(getUserRegister, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];
      print('____param______${getUserRegister}______${param}___');
      if (status) {
        Get.toNamed(otpScreen, arguments: [mobile, getData['otp']]);
        Fluttertoast.showToast(msg: msg);
      } else {
        Fluttertoast.showToast(msg: msg);
      }
      isLoading.value = false;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime lastAllowedDate = DateTime(currentDate.year - 18);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: lastAllowedDate,
      firstDate: DateTime(currentDate.year - 100),
      lastDate: lastAllowedDate,
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      update();
    }
  }
}
