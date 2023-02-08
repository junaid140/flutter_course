import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/user.dart';
import 'package:flutter_course/screens/user/user_profile.dart';

import '../../data/services/api_services.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
      ),
      body: Container(
        child: FutureBuilder<List<User>>(
          future: apiServices.getAllUser(),
          builder: (context,AsyncSnapshot<List<User>> snapshot){
            return snapshot.hasData?
            ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context,index){

              return ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>UserProfile(userId: '${snapshot.data![index].id}',)));
                },
                leading: Text("${snapshot.data![index].id}"),
                title: Text("${snapshot.data![index].username}"),
                subtitle: Text("${snapshot.data![index].email}"),
              );
            }):Center(child: CircularProgressIndicator(),);

          },
        ),
      ),

    );
  }
}
