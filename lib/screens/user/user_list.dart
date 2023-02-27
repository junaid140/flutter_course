import 'dart:io';

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
  TextEditingController name= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
      ),
      body: Container(
        child: FutureBuilder(
          future: apiServices.getAllUser(),
          builder: (context, snapshot){
            return snapshot.hasData?
            ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context,index){

              return ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>UserProfile(userId: '${snapshot.data![index]["_id"]}',)));
                },
                leading: Text("${snapshot.data![index]["_id"]}"),
                title: Text("${snapshot.data![index]["name"]}"),
                subtitle: Text("${snapshot.data![index]["name"]}"),
                trailing: Column(
                  children: [
                    InkWell(
                        onTap: (){
                          print("----");

                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Edit Item"),
                              content: TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                  hintText: "Enter Name"
                                ),
                              ),
                              actions: [
                                ElevatedButton(onPressed: ()async{
                                  if(name.text.isNotEmpty){
                                    var data = await ApiServices().updateNA(snapshot.data![index]["_id"], name.text);
                                    if(data!=null){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserList()));
                                    }
                                  }
                                  else{
                                    print("Name is Empty");
                                  }
                                }, child: Text("Submit"))
                              ],

                            );
                          });
                        },
                        child:Icon(Icons.edit)),
                    InkWell(
                        onTap: (){
                          print("----");

                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Delete Item"),
                              content: Text("Are you want to delete it?"),
                              actions: [
                                ElevatedButton(onPressed: ()async{

                                    var data = await ApiServices().daleteNA(snapshot.data![index]["_id"]);
                                    if(data!=null){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserList()));
                                    }


                                }, child: Text("Yes")),
                                ElevatedButton(onPressed: ()async{
                                 Navigator.pop(context);
                                }, child: Text("No"),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.red)
                                  ),
                                )
                              ],

                            );
                          });
                        },
                        child:Icon(Icons.delete,color: Colors.red,)),
                  ],
                ),
              );
            }):Center(child: CircularProgressIndicator(),);

          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Edit Item"),
              content: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: "Enter Name"
                ),
              ),
              actions: [
                ElevatedButton(onPressed: ()async{
                  if(name.text.isNotEmpty){
                    var data = await ApiServices().createNA(name.text);
                    if(data!=null){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserList()));
                    }
                  }
                  else{
                    print("Name is Empty");
                  }
                }, child: Text("Submit"))
              ],

            );
          });
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
