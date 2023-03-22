import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {

  File? selectImage;
  uploadImage()async{
  final ImagePicker _picker = ImagePicker();
  var image =   await _picker.pickImage(source: ImageSource.gallery);
  print(image!.path);
  if(image.path.isNotEmpty){
  setState(() {
  selectImage = File(image.path);
  });
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Upload Profile"),
      ),
      body: Container(
        width:double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
                ),
                child: selectImage!=null?
                Image.file(selectImage!):Icon(Icons.add, size: 20,),
              ),
            ),
          ElevatedButton(onPressed: (){
            if(selectImage!=null){
              var storageRef = FirebaseStorage.instance.ref();
              final imagesRef = storageRef.child("images");

              final spaceRef = storageRef.child("images/${selectImage!.path.split('/')}");
            var uploadData =  spaceRef.putFile(selectImage!).then((value)async{
             print(value.ref.fullPath);
             print(value.ref.getDownloadURL());
             print(value.ref.name);
             print(value.ref);
             String imageUrl = await value.ref.getDownloadURL();
             await FirebaseFirestore.instance.collection("Image").doc().set(
                 {
                   "image":imageUrl,
                 });
            });




            }
            else{
              print("please Upload Image");
            }

          }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
