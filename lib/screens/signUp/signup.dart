import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GoogleSignIn googleSignIn = GoogleSignIn();

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

                }, child: Text("SignUp")),

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
