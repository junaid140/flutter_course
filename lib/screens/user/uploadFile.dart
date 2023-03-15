import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../data/services/api_services.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: ()async{
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              print(result.files.first.path!);
              File audioFile = File(result.files.first.path!);

            await  apiServices.uploadFile(audioFile);

              // Upload file
            }
          },
          icon: Icon(Icons.upload),
        )
      ),
    );
  }
}
