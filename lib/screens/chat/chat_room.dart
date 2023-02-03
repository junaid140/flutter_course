import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/chatroom.dart';


class ALlChatRoom extends StatefulWidget {
  const ALlChatRoom({Key? key}) : super(key: key);

  @override
  State<ALlChatRoom> createState() => _ALlChatRoomState();
}

class _ALlChatRoomState extends State<ALlChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder(
        future:  FirebaseFirestore.instance.collection("chatRoom").where("users",arrayContains: FirebaseAuth.instance.currentUser!.uid).get(),
        builder: (context, snapshot){
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                return ListTile(
                    onTap: ()async{

                      String chatRoomId = "${FirebaseAuth.instance.currentUser!.uid}_${snapshot.data!.docs[index].data()["uid"]}";
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(docId:snapshot.data!.docs[index].id)));
                      // await  FirebaseFirestore.instance.collection("chatRoom")
                      //     .doc(chatRoomId).set({
                      //   "chatRoomId":chatRoomId,
                      //   "users":[FirebaseAuth.instance.currentUser!.uid,
                      //     snapshot.data!.docs[index].data()["uid"]]
                      // });
                    },
                    leading: Text("${index+1}"),
                    title: Text(snapshot.data!.docs[index].data()["chatRoomId"]));
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
