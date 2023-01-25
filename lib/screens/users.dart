import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
      ),
      body: FutureBuilder(
        future:  FirebaseFirestore.instance.collection("user").where("email",isNotEqualTo: "hello@gmail.com").get(),
        builder: (context, snapshot){
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
            return ListTile(
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
