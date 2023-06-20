import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AlertUploadDocument extends StatefulWidget {
  const AlertUploadDocument({super.key});

  @override
  State<AlertUploadDocument> createState() => _AlertUploadDocumentState();
}

class _AlertUploadDocumentState extends State<AlertUploadDocument> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: new EdgeInsets.all(30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Upload Document", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: GestureDetector(
                        onTap: () async{
                          final result = await ImagePicker()
                            .pickImage(source: ImageSource.camera);
                        if (result == null) return;
                        /* AppConstants.fileIs = result;
                        AppConstants.flag = true;
                        print('files length is ${AppConstants.fileIs.toString()}'); */
                          print("camera");
                          //Navigator.popAndPushNamed(context, AppRoutes.AppForPetDogLicense);
                        },
                        child: Text("Camera"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: GestureDetector(
                        onTap: () async{
                           print("Gallery");
                           final result = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (result == null) return;
                      /*  AppConstants.fileIs = result;
                       AppConstants.flag = true;
                      print('files length is ${ AppConstants.fileIs.toString()}'); */
                      //Navigator.popAndPushNamed(context, AppRoutes.AppForPetDogLicense);
                        },
                        child: Text("Gallery"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: GestureDetector(
                        onTap: () {
                           print("cancel");
                           /* AppConstants.flag = false; */
                           Navigator.pop(context);
                        },
                        child: Text("cancel"))),
                    )
            ],
          ),
        ),
      ),
    );
  }
}