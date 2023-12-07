
import 'dart:convert';
import 'dart:io';
import 'package:booknplay/Services/api_services/apiConstants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:booknplay/Widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_profile_model.dart';
import '../../Utils/Colors.dart';
import '../../Widgets/auth_custom_design.dart';

class EditProfileScreen extends StatefulWidget {
   EditProfileScreen({Key? key,this.getProfileModel}) : super(key: key);
 final GetProfileModel? getProfileModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.getProfileModel?.profile?.userName ?? "" ;
    mobileController.text = widget.getProfileModel?.profile?.mobile ?? "" ;
    emailController.text = widget.getProfileModel?.profile?.email ?? "" ;
    addressController.text = widget.getProfileModel?.profile?.address ?? "" ;
    image = widget.getProfileModel?.profile?.image  ?? '';
  print('_____nameController_____${nameController.text}_________');
    super.initState();

    referCode();
  }
  String? userId;
  referCode() async {
    userId = await SharedPre.getStringValue('userId');


  }
    String ? image;
  final ImagePicker _picker = ImagePicker();
  bool isEditProfile = false ;
  File? imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<bool> showExitPopup1() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Center(child: Text('Select Image')),
          content: Row(
            // crossAxisAlignment: CrossAxisAlignment.s,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  getImage(ImageSource.camera, context, 1);
                },
                child: Container(
                  height: 40,width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(child: Text("Camera")),
                ),
              ),

               SizedBox(
                width: 15,
              ),

              InkWell(
                onTap: (){
                  getImageCmera(ImageSource.gallery,context,1);
                },
                child: Container(
                  height: 40,width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: Center(child: Text("Gallery")),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //
              //   },
              //   child: Text('Gallery'),
              // ),
            ],
          )),
    ) ; //if showDialouge had returned null, then return false
  }

  void requestPermission(BuildContext context,int i) async{
    print("okay");
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.mediaLibrary,
      Permission.storage,
    ].request();
    if(statuses[Permission.photos] == PermissionStatus.granted&& statuses[Permission.mediaLibrary] == PermissionStatus.granted){
      getImage(ImageSource.gallery, context, 1);


    }else{
      getImageCmera(ImageSource.camera,context,1);
    }
  }
  Future getImage(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50
    );
    setState(() {
      imageFile = File(image!.path);
    });

    Navigator.pop(context);
  }
  Future getImageCmera(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
      source: source,
        imageQuality: 50
    );
    setState(() {
      imageFile = File(image!.path);
    });
    Navigator.pop(context);
  }
  void getCropImage(BuildContext context, int i, var image) async {
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );
    setState(() {
      if (i == 1) {
        imageFile = File(croppedFile!.path.toString());
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              customEdit(context, ''),
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
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Stack(
                            children:[
                              imageFile == null
                                  ?  SizedBox(
                                height: 110,
                                width: 110,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  elevation: 5,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(image!, fit: BoxFit.cover,)
                                    // Image.file(imageFile!,fit: BoxFit.fill,),
                                  ),
                                ),
                              ) :

                              Container(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(imageFile ?? File(''),fit: BoxFit.fill)
                                  // Image.file(imageFile!,fit: BoxFit.fill,),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  // top: 30,
                                  child: InkWell(
                                    onTap: (){
                                      showExitPopup1();
                                      // showExitPopup(isFromProfile ?? false);
                                    },
                                    child: Container(
                                        height: 30,width: 30,
                                        decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: Icon(Icons.camera_enhance_outlined,color: Colors.white,)),
                                  ))
                            ]
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,left: 10),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Name'),

                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: addressController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,left: 10),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Address'),

                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Padding(

                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              controller: mobileController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,left: 10),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Mobile'),

                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 5,left: 10),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Email'),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        AppButton1(
                          title: isEditProfile == true ? "please wait...":"Edit Profile",
                          onTap: (){
                            updateProfile();
                          },
                        )

                      ],
                    ),
                  ) ,
                ),
              ),
            ],
          ),
        ));

  }

  updateProfile() async {
    setState(() {
      isEditProfile =  true;
    });
    var headers = {
      'Cookie': 'ci_session=df5385d665217dba30014022ebc9598ab69bb28d'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl1/Apicontroller/apiProfileUpdate'));
    request.fields.addAll({
      'user_name':nameController.text,
      'email':emailController.text,
      'address':addressController.text,
      'user_id':userId.toString()
    });
    print('____request.fields______${request.fields}_________');
    if(imageFile != null){
      request.files.add(await http.MultipartFile.fromPath('image', imageFile?.path ?? ''));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
    var result =  await response.stream.bytesToString();
    var finalResult = jsonDecode(result);
    Fluttertoast.showToast(msg:"${finalResult['msg']}" );
    setState(() {
      isEditProfile =  false;
    });
    Navigator.pop(context);
    }
    else {
      setState(() {
        isEditProfile =  false;
      });
    print(response.reasonPhrase);
    }


  }
}
