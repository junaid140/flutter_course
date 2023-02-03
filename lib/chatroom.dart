import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'multi_child_widget.dart';

class ChatRoom extends StatelessWidget {
  String? docId;
   ChatRoom({super.key,this.docId});
   TextEditingController messages = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatroom"), actions: []),
      // body: MultiChildWidget(userId:docId),
      body: Container(child: StreamBuilder(
        stream:  FirebaseFirestore.instance.collection("chatRoom").doc(docId).collection("messages").orderBy("time",descending: true).snapshots(),
        builder: (context, snapshot){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              reverse: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  return  Align(
                      alignment:snapshot.data!.docs[index].data()["uid"]==FirebaseAuth.instance.currentUser!.uid ?Alignment.centerRight:Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(snapshot.data!.docs[index].data()["text"])));
                }),
          );
        },
      ),),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border:
                Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8
              )
            ),
            child: TextFormField(
              controller: messages,

              decoration: InputDecoration(
                hintText: "Enter Your Message",
                border: InputBorder.none
              ),
            ),
          ),
          IconButton(onPressed: ()async{
            if(messages.text.isNotEmpty){
             await FirebaseFirestore.instance.collection("chatRoom").doc(docId).collection("messages").doc().set(
                 {
                   "text":messages.text,
                   "time":DateTime.now(),
                   "uid":FirebaseAuth.instance.currentUser!.uid
                 });
            }
            messages.text ="";
          }, icon:Icon(Icons.send))
        ],
      ),
    );
  }
}
