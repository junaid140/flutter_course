import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat/chat_room.dart';


class ALlUsers extends StatefulWidget {
  const ALlUsers({Key? key}) : super(key: key);

  @override
  State<ALlUsers> createState() => _ALlUsersState();
}

class _ALlUsersState extends State<ALlUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ALlChatRoom()));
        }, icon: Icon(Icons.chat))],
      ),
      body: FutureBuilder(
        future:  FirebaseFirestore.instance.collection("user").where("uid",isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (context, snapshot){
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
            return ListTile(
              onTap: ()async{
                String chatRoomId = "${FirebaseAuth.instance.currentUser!.uid}_${snapshot.data!.docs[index].data()["uid"]}";
                await  FirebaseFirestore.instance.collection("chatRoom")
                    .doc(chatRoomId).set({
                  "chatRoomId":chatRoomId,
                  "users":[FirebaseAuth.instance.currentUser!.uid,
                    snapshot.data!.docs[index].data()["uid"]]
                });
              },
                leading: Text("${index+1}"),
                title: Text(snapshot.data!.docs[index].data()["email"]));
          });
        },
      ),
      // body: StreamBuilder(
      //   stream:  FirebaseFirestore.instance.collection("user").snapshots(),
      //   builder: (context, snapshot){
      //     return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (context,index){
      //       return Text(snapshot.data!.docs[index].data()["email"]);
      //     });
      //   },
      // ),
      
    );
  }
}
