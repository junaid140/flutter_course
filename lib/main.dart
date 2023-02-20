import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/screens/24_dec/24dec.dart';
import 'package:flutter_course/screens/27_dec/27_dec.dart';
import 'package:flutter_course/screens/28_dec/28_dec.dart';
import 'package:flutter_course/screens/animationscreens/animation_screen.dart';
import 'package:flutter_course/screens/login/login.dart';
import 'package:flutter_course/screens/onboardingScreen/onboarding_screen.dart';
import 'package:flutter_course/screens/packagesList.dart';
import 'package:flutter_course/screens/phonelogin.dart';
import 'package:flutter_course/screens/product/product.dart';
import 'package:flutter_course/screens/signUp/signup.dart';
import 'package:flutter_course/screens/user/user_list.dart';
import 'package:flutter_course/screens/users.dart';
import 'package:flutter_course/tab_bar_lecture.dart';

import '19dec.dart';
import 'buttons_lecture.dart';
import 'form_widgets.dart';
import 'package:firebase_core/firebase_core.dart';

late List<CameraDescription> cameras;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Product(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        leading: Icon(Icons.abc),
      ),
      body: Center(child: Text("jsdhjbdshj nbhjb hjb hb ")),
      bottomNavigationBar: Text("sdbjscbdhj"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){print("jhsdbchvsdhcvs");},
        child: Icon(Icons.add),
      )
    );
  }
}



class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Whatsapp"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,5,20,5),
              child: Icon(Icons.menu),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              child:Text("")
            ),
          ),

        ),

        body:  TabBarView(
          children: [
            Container(
              height: 100,
              child: ListTile(
                onTap: (){
                  print("sjbdchshj");
                },
                leading: Icon(Icons.person,),
                title: Text("Hello"),
                subtitle: Text("subtitle"),
                trailing: Text("04:00 PM"),

              ),
            ),
            Home(),
            SizedBox(
              height: 100,
              child: ListTile(
                onTap: (){
                  print("sjbdchshj");
                },
                leading: Icon(Icons.person,),
                title: Text("Hello"),
                subtitle: Text("subtitle"),
                trailing: Text("04:00 PM"),

              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
          alignment: Alignment.center,
          child:  TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
                // text: "chat",
              ),
              Tab(text: "status",),
              Tab(text: "call",)
            ],
          ),
        ),

      ),
    );
  }
}
