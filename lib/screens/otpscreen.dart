import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class OTPScreeen extends StatefulWidget {
 final String number ;
  const OTPScreeen({Key? key,required this.number}) : super(key: key);

  @override
  State<OTPScreeen> createState() => _OTPScreeenState();
}

class _OTPScreeenState extends State<OTPScreeen> {

  phoneVerification()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.number,
        verificationCompleted: (phoneAuthCreditinal)async{
          await  FirebaseAuth.instance.signInWithCredential(phoneAuthCreditinal);
          Navigator.pop(context);

        },
        verificationFailed: (phone){
          print(phone);

        },
        codeSent: (code,val)async{
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = otpController.text;

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: code, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await FirebaseAuth.instance.signInWithCredential(credential);
          Navigator.pop(context);

        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeOut){

        },
        timeout: Duration(seconds: 120)
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    phoneVerification();
    super.initState();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  TextEditingController otpController = TextEditingController();


  GlobalKey<FormState> formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return  Scaffold(
      appBar: AppBar(
        title: Text("OTP"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              // androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsUserConsentApi,
              length: 6,
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s!.isNotEmpty ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                phoneVerification();
                print(pin);
              },
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ()async{
              await phoneVerification();
            }, child: Text("OTP"))
          ],
        ),
      ),
    );
  }
}
