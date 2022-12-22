//onboarding_intro_screen

/* ----------- 21-dec-2022  */

//carousel_slider
//flutter svg
//font_awesome_flutter
//grouped_list
//flutter_rating_bar
//flutter toast

/* ----------- 22-dec-2022  */
//url_luncher
//Image_picker
//file picker
//camera
//photo_view
//percent_indicator


/* task 22-dec - 2022 */



//flutter_staggered_grid_view
//avatar_circle_bapp
//google_fonts
//video_player
//audioplayers
//modal_bottom_sheet
//animations


/* task 23-dec - 2022 */

//DataTable






import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class PackagesExamples extends StatefulWidget {
  const PackagesExamples({Key? key}) : super(key: key);

  @override
  State<PackagesExamples> createState() => _PackagesExamplesState();
}
class _PackagesExamplesState extends State<PackagesExamples> {

  File? selectImage;
 late  CameraController controller;
   @override
  void initState() {
    // TODO: implement initState
     controller = CameraController(cameras![0], ResolutionPreset.max);
     controller!.initialize().then((_) {
       if (!mounted) {
         return;
       }
       setState(() {});
     }).catchError((Object e) {
       if (e is CameraException) {
         switch (e.code) {
           case 'CameraAccessDenied':
           // Handle access errors here.
             break;
           default:
           // Handle other errors here.
             break;
         }
       }
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Packages"),
        actions: [
          SvgPicture.asset(
            "assets/images/clarity_wallet-solid.svg",
            color: Colors.red,

        )],
      ),
      body: Column(
        children: [
          CarouselSlider(
              items: [
                Container(child: Text("shhhh"),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red
                ),
                ),
                Container(child: Text("shhhh"),
                  width: double.infinity,

                  decoration: BoxDecoration(
                      color: Colors.green
                  ),),
                Container(
                  child: Text("shhhh"),
                  width: double.infinity,

                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),),
               ],
              options: CarouselOptions(
                height: 200,
                aspectRatio: 2,
          )),
          Center(child: CircularProgressIndicator()),
          LinearProgressIndicator(color: Colors.red,
            backgroundColor: Colors.red.withOpacity(0.5),),

          GestureDetector(
              onTap: ()async{

              if (!await launchUrl(Uri.parse("https://google.com"),)) {
              throw 'Could not launch ';
              }
              },
              child: Text("Open This Link")),

          GestureDetector(
              onTap: ()async{
                final ImagePicker _picker = ImagePicker();
             var image =   await _picker.pickImage(source: ImageSource.gallery);
                print(image!.path);
                if(image.path.isNotEmpty){
                  setState(() {
                    selectImage = File(image.path);
                  });
                }

              },
              child: Container(child:selectImage==null? Icon(Icons.camera_alt_outlined,size: 50,):
              Image.file(selectImage!))),
          GestureDetector(
              onTap: ()async{
                final FilePickerResult? _picker = await FilePicker.platform.
                pickFiles(

                );
             var image =   await _picker!.files.first;
                print(image.path);
                if(image.path!.isNotEmpty){
                  setState(() {
                    selectImage = File(image.path!);
                  });
                }

              },
              child: Container(child:selectImage==null? Icon(Icons.camera_alt_outlined,size: 50,):
              Image.file(selectImage!))),
          // CameraPreview(controller!)
          LinearPercentIndicator(

            percent: .80,
          ),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 10.0,
            percent: .80,

            center: new Text("sjchvsbj%"),
            progressColor: Colors.green,
          )

        ],
      ),
    );
  }
}


