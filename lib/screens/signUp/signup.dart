import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

                Text("SignUp"),
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
                  UserCredential userCredential =   await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                User user =   userCredential.user!;
                if(user.uid.isNotEmpty){
                  print("User has been Created");
                  await FirebaseFirestore.instance.collection("user").doc("${user.uid}")
                      .set({
                    "email":user.email,
                    "uid":user.uid
                  });

                  print(user);
                }

                  }
                  catch(e){
                    print(e);

                  }

                }, child: Text("SignUp"))

              ],
            ),
          ),
        ),
      ),

    );
  }
}
