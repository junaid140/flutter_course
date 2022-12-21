//Animated container
//Hero
//Timer
//Transform

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {

  double width = 100;
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: AnimatedContainer(
        //   color: Colors.red,
        //   width: width,
        //   height: height,
        //
        //   duration: Duration(seconds: 1),
        //   child: TextButton(
        //     onPressed: (){
        //       setState((){
        //         width = 200;
        //         height = 200;
        //
        //       });
        //      },
        //     child: Text("Hello"),
        //   ),
        // ),

        // body: ListTile(
        //   onTap: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
        //   },
        //   leading: Hero(
        //       tag: "1",
        //
        //       child: Image.asset("assets/images/img.png")),
        //   title: Text("Test Post"),
        //   subtitle: Text("Subtitle"),
        // ),
        body: Center(
          child: Column(
            children: [
              Container(

                child: Transform.rotate(angle: pi/2,child: Text("Hello"),),
              ),
              Transform.scale(scale: 2,child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                  ),child: Text("helloo")),),
              Transform(
                transform: Matrix4.rotationX(10),
              child: Text("shdvshbhgdsvc"),
              ),
              Transform.translate(offset: Offset.fromDirection(2),

              child: Text("jsdvfbhsh"),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>AnimationScreen()));
    });

    return Scaffold(
      body: Center(
        child: Container(
          child:  Image.asset("assets/images/img.png"),
        ),
      ),
    );
  }
}


class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Hero(
              tag: "1",
              child: Image.asset("assets/images/img.png",height: 200,width: double.infinity,
                fit: BoxFit.cover,),
            ),
            Text("Test Post"),
          ],
        ),
        
        
      ),
    );
  }
}





