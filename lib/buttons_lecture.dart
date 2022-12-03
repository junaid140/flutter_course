import 'package:flutter/material.dart';
import 'package:flutter_course/tab_bar_lecture.dart';
class ButtonsLectuer extends StatelessWidget {
  const ButtonsLectuer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         // child: TextButton(
         // onPressed: (){},
         //   style: ButtonStyle(
         //     backgroundColor: MaterialStateProperty.all(Colors.red)
         //   ),
         //   child: Text("sjfhjdsbj"),
         // ),
        // child: OutlinedButton(
        //   onPressed: (){
        //
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarLecture()));
        //   },
        //   style: ButtonStyle(),
        //   child: Text("Elevated Button"),
        // ),
        child: InkWell(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBarLecture()));
          },
          child: Text("Elevated Button"),
        ),

      ),
    );
  }
}
