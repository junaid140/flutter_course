//Alert Dailog,
//show Dailog,
//showModalBottomSheet
//RichText


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailogBox extends StatefulWidget {
  const DailogBox({Key? key}) : super(key: key);

  @override
  State<DailogBox> createState() => _DailogBoxState();
}

class _DailogBoxState extends State<DailogBox> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        color: Colors.green,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(color: Colors.black,child: Text("sdvjbshjj"),),
            Spacer(),
            Container(color: Colors.red,child: Text("jhscjhb"),),
            Spacer(flex: 2,),
            Container(color: Colors.black,child: Text("sdvjbshjj"),),
            Spacer(),
            Container(color: Colors.red,child: Text("jhscjhb"),),
            Spacer(),



            // ElevatedButton(onPressed: (){
            //   // showDialog(context: context, builder: (context){
            //   //   return AlertDialog(
            //   //   // return CupertinoAlertDialog(
            //   //     title: Text("Alert Dailog"),
            //   //     content: Text("Are you want to delete it"),
            //   //     actions: [
            //   //       ElevatedButton(onPressed: (){
            //   //
            //   //       }, style: ButtonStyle(
            //   //         backgroundColor: MaterialStateProperty.all(Colors.green)
            //   //       ),
            //   //
            //   //           child: Text("Yes")),
            //   //       ElevatedButton(onPressed: (){
            //   //
            //   //       }, style: ButtonStyle(
            //   //         backgroundColor: MaterialStateProperty.all(Colors.red)
            //   //       ),
            //   //
            //   //           child: Text("No")),
            //   //     ],
            //   //
            //   //   );
            //   // });
            //
            //   showModalBottomSheet(context: context, builder: (context){
            //     return Card(
            //         child: Container(child: Text("Hello Bottom sheet"),));
            //   });
            // },
            //     child: Text("Press it",)),
            //
            // RichText(text:TextSpan(
            //   children: [
            //     TextSpan(text:"Hello",
            //       style: TextStyle(fontSize: 18,color: Colors.red)
            //     ),
            //     TextSpan(text:"Hello",
            //       style: TextStyle(fontSize: 14,color: Colors.green)
            //     ),
            //   ]
            // ),



            // )

          ],
        ),
      ),

    );
  }
}


