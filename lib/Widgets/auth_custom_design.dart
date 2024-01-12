import 'package:booknplay/Constants.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customAuthDegine (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        color: AppColors.primary
        // gradient: LinearGradient(
        //   // colors: [AppColors.primary, AppColors.secondary],
        //   // // Define the colors
        //   // begin: Alignment.topCenter,
        //   // end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset(image ?? AppConstants.loginLogo, scale: 2),
             Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.08),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
          // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}

Widget customAuthSignUp (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.08),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}

Widget customAuthOtp (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50,left: 5,right: 5),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                const SizedBox(width: 30,),
                const Text("Verification",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",style: TextStyle(color: AppColors.whit,fontSize: 15,fontWeight: FontWeight.normal),),
            ),
           // Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.08),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}

Widget customHome (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Drawmoney",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),   color: AppColors.whit,),

                    child: Image.asset("assets/images/notification.png",color: AppColors.primary,scale: 1.2,),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}


Widget customProfile (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My Account",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}
Widget customResult (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Result",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}
Widget customWinner (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 100,),
                 Text("Winner",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Image.asset(image ?? AppConstants.signupLogo, scale: 2),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.18),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            // Top-left corner radius
            topRight: Radius.circular(30),
            // Bottom-right corner with no rounding
          ),
        ),
      ),
    ),
  ],);
}
Widget customLottery (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 100,),
                 Text("My Ticket",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customDetails (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 40,),
                 const Text("Your Ticket Number",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customWinning (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
      ),
      child:
      Padding(
        padding: const EdgeInsets.only(top: 0,left: 5,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 20,),
             Row(
               children: [
                 InkWell(
                  onTap: (){
                  Navigator.pop(context);
                  }, child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                 SizedBox(width: 30,),
                 Text(
                   title,
                   style: const TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.w500,
                       color: Colors.white),
                 ),
               ],
             ),
            //  Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       InkWell(
            //           onTap: (){
            //             Navigator.pop(context);
            //           },
            //           child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
            //       const SizedBox(width: 60,),
            //      const Text("Winning Price",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),
            //
            //     ],
            //   ),
            // ),
            const SizedBox(height: 0,),


            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}

Widget customWithdrow (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary
        // gradient: LinearGradient(
        //   colors: [AppColors.primary, AppColors.secondary],
        //   // Define the colors
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 100,),
                  const Text("Wallet",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customInvite (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 70,),
                  Text("My Invitation",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customAddMoney (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 70,),
                  Text("Add Money",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customTra (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 70,),
                  Text("My Transaction",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customPrivacy (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 70,),
                  Text("Privacy Policy",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customTmc (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 40,),
                  const Text("Term And Condition",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customFaq (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 120,),
                  const Text("FAQs",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}
Widget customEdit (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 80,),
                  const Text("Edit Profile",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}

Widget customResultDetails (BuildContext context, String title, {String? image}){
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: AppColors.primary

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new,color: AppColors.whit,)),
                  const SizedBox(width: 80,),
                  const Text("Result Details",style: TextStyle(color: AppColors.whit,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            const SizedBox(height: 10,),

            Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    ),
  ],);
}


