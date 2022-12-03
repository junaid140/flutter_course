import 'package:flutter/material.dart';

import 'datafile.dart';
class MultiChildWidget extends StatelessWidget {
  int? userId ;
   MultiChildWidget({Key? key,this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // child: ListView(
        //   scrollDirection: Axis.horizontal,
          child:SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            // child: Row(
            child:Column(
            // child:Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: chatData.map((data) =>  Align(
                alignment: data["send_by"]==userId?Alignment.centerLeft:Alignment.centerRight,
                child: customChatMessageTile(data["message"])),).toList()
        ),
          ),
      ),

    );
  }

  Widget customChatMessageTile(text){
    return  Container(
      // height: 50,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 8,
          top: 8,bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue,width: 2.0)
      ),
      child: Column(
        children: [

          Text("UserName,"),
          Text("$text"),
        ],
      ),);
  }

}
