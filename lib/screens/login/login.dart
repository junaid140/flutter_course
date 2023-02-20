import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/services/api_services.dart';
import 'package:flutter_course/screens/user/user_list.dart';
import 'package:flutter_course/screens/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 50,),

                Text("Login"),
                SizedBox(height: 30,),
                TextFormField(
                  controller: email,
                  decoration:InputDecoration (
                    hintText: "Enter Email",
                    labelText: "Email Address",
                    border: OutlineInputBorder(

                    ),
                    focusedBorder: OutlineInputBorder(

                    ),
                    enabledBorder: OutlineInputBorder(

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: password,
                  decoration:InputDecoration (
                    hintText: "Enter Password",
                    labelText: "Password",
                    border: OutlineInputBorder(

                    ),
                    focusedBorder: OutlineInputBorder(

                    ),
                    enabledBorder: OutlineInputBorder(

                    ),
                  ),
                ),
                ElevatedButton(onPressed: ()async{
                  print("-----");
                  try{
                   var userData = await ApiServices().login(email.text, password.text);

                   print(userData);
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList()));

                  }
                  catch(e){
                    print(e);

                  }

                }, child: Text("Login")),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


firebaseFirestore()async{
}
