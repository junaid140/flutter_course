import 'package:flutter/material.dart';

import 'multi_child_widget.dart';

class ChatRoom extends StatelessWidget {
  int? userId;
   ChatRoom({super.key,this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatroom"), actions: []),
      body: MultiChildWidget(userId:userId),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border:
            Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8
          )
        ),
        child: Text("Type message"),
      ),
    );
  }
}
