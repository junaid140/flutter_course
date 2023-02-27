import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/user.dart';

import '../../data/services/api_services.dart';

class UserProfile extends StatefulWidget {
  final String userId;
  const UserProfile({Key? key,required this.userId}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Container(
        child: FutureBuilder(
          future: apiServices.getUser(widget.userId),
          builder: (context,AsyncSnapshot snapshot){
            return snapshot.hasData?
            ListView(
                children: [
                  ListTile(
                    leading: Text("${snapshot.data!["_id"]}"),
                    title: Text("${snapshot.data!["name"]}"),
                    subtitle: Text("${snapshot.data!["name"]}"),
                  )
                ],):Center(child: CircularProgressIndicator(),);

          },
        ),
      ),

    );
  }
}
