import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:flutter_course/screens/otpscreen.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Login"),
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(flex: 1,),
            Text("Login",style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600
            ),),
            Spacer(flex: 1,),

            TextFormField(
              controller: phone,

              decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: "Phone Number",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),

            ),
            Spacer(flex: 1,),

            ElevatedButton(onPressed: ()async{

              Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreeen(number: phone.text,)));

            }, child: Text("Login")),
            Spacer(flex: 3,),

          ],
        ),
      ),

    );
  }
}
