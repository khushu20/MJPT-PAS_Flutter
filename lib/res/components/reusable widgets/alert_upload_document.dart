
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mjpt_pas/res/constants/app_constants.dart';

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
        width: MediaQuery.of(context).size.width * 0.9,
        //padding: new EdgeInsets.all(30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: 3,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add Photo!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async {
                      final result = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (result == null) return;
                      AppConstants.selectedImage = result;
                      setState(() {
                        AppConstants.docFlag = true;
                      });
                      Navigator.pop(context);
                      print("Choose from Library");
                    },
                    child: Text("Choose from Library")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () async {
                      print("choose Documents");
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: [
                          'pdf',
                          'doc',
                          'docx'
                        ], // Customize allowed extensions as per your requirement
                      );
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        AppConstants.selectedFile = file.path!; 
                      } else {
                        return null; // User canceled the picker
                      }
                      AppConstants.docFlag = true;
                      Navigator.pop(context);
                    },
                    child: Text("choose Documents")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      print("cancel");
                      /* AppConstants.flag = false; */
                      Navigator.pop(context);
                    },
                    child: Text("cancel")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
