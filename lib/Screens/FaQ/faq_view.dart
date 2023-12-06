import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Models/HomeModel/get_faq_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Utils/Colors.dart';
import '../../Widgets/auth_custom_design.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key, }) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              customFaq(context, ''),
              Padding(
                // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
                padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 8.1),
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
                  child:faqModel == null ? const Center(child: CircularProgressIndicator()):  faqModel?.faqs?.length == 0 ?const Text("No Faqs list"): Container(
                    height: MediaQuery.of(context).size.height/1,
                    child: ListView.builder(
                      key: Key('builder ${selected.toString()}'),
                      itemCount:faqModel?.faqs?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.fntClr)
                            ),
                            child: ExpansionTile(

                              textColor: AppColors.fntClr,
                              iconColor: AppColors.fntClr,
                              collapsedTextColor: AppColors.secondary,
                              collapsedIconColor: AppColors.secondary,
                              collapsedBackgroundColor: AppColors.whit,

                              key:  Key(index.toString()),
                              initiallyExpanded: index == selected ,
                              title: Row(
                                children: [

                                  Text('${faqModel?.faqs?[index].question}',style: TextStyle(color: AppColors.secondary),),
                                  // Text('${faqModel?.faqs?[index].answer}'),
                                ],
                              ),
                              onExpansionChanged: (isExpanded) {

                                if(isExpanded) {
                                  setState(()  {
                                    const Duration(milliseconds: 2000);
                                    selected = index;
                                  });

                                }else{
                                  setState(() {
                                    selected = -1;
                                  });

                                }


                              },
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 350,
                                      child: Text("${faqModel?.faqs?[index].answer}",overflow: TextOverflow.ellipsis,maxLines: 10,style: const TextStyle(color: AppColors.fntClr),)),
                                )

                              ],
                            ),

                          ),

                        );

                      },

                    ),
                  ),
                ),
              ),
            ],
          ),
        ));

  }
  int? selected = 0;
  FaqModel?faqModel;
  Future<void> getFaq() async {
    apiBaseHelper.postAPICall2(getFagsAPI).then((getData) {
      setState(() {
        faqModel = FaqModel.fromJson(getData);
      });

      //isLoading.value = false;
    });
  }
}