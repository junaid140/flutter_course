import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/services/api_services.dart';
import 'package:flutter_course/screens/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateNA extends StatefulWidget {
  const CreateNA({Key? key}) : super(key: key);

  @override
  State<CreateNA> createState() => _CreateNAState();
}

class _CreateNAState extends State<CreateNA> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
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
                  controller: name,
                  decoration:InputDecoration (
                  hintText: "Enter name",
                    labelText: "Name",
                    border: OutlineInputBorder(

                    ),
                    focusedBorder: OutlineInputBorder(

                    ),
                    enabledBorder: OutlineInputBorder(

                    ),
                  ),
                ),
                SizedBox(height: 10,),

                ElevatedButton(onPressed: ()async{
                  print("-----");
                  try{
                    var data = ApiServices().createNA(name);
                    print(data);

                  }
                  catch(e){
                    print(e);

                  }

                }, child: Text("Create NA")),

                ElevatedButton(
                onPressed: ()async{
                 try {
                        GoogleSignIn _googleSignIn = GoogleSignIn();
                        GoogleSignInAccount? googleAccount =
                            await _googleSignIn.signIn();
                        GoogleSignInAuthentication? googleSignInAuthentication =
                            await googleAccount!.authentication;

                        OAuthCredential googleAuthProvider =
                            GoogleAuthProvider.credential(
                                idToken: googleSignInAuthentication.idToken,
                                accessToken:
                                    googleSignInAuthentication.accessToken);

                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithCredential(googleAuthProvider);
                        User? user = userCredential.user;
                        if(user!.uid.isNotEmpty){
                          FirebaseFirestore.instance.collection("user").where("uid",isEqualTo: user.uid).get().then((value) async{
                            if(value.docs.isEmpty){
                              await FirebaseFirestore.instance.collection("user").doc("${user.uid}")
                                  .set({
                                "email":user.email,
                                "uid":user.uid
                              });

                            }
                            else{
                              print("User Exist");
                            }
                          });
                        }

                      }catch(e){
                   print(e);
                 }
                    }, child: Text("Signin With google")),
                FirebaseAuth.instance.currentUser!.uid.isNotEmpty? ElevatedButton(
                onPressed: ()async{
                 try {
                   print("------");
                  await googleSignIn.signOut();
                  await FirebaseAuth.instance.signOut();

                      }catch(e){
                   print(e);
                 }
                    }, child: Text("SignOut google")):Container(),
                ElevatedButton(onPressed: (){
                  print(   FirebaseAuth.instance.currentUser!.uid);
                }, child: Text("Print UID"))
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
