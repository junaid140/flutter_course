import 'package:flutter/material.dart';

import '15dec.dart';

class FormWidget extends StatefulWidget {
   FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> form = GlobalKey<FormState>();

  String? username;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page",
        style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [Icon(Icons.menu,color: Colors.black,)],
      ),
      body: Center(
       child: Form(
         key: form,
         child: Column(
            children: [

              TextField(
                controller: textEditingController,
              ),
              TextFormField(
                // controller: textEditingController,
                // maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val){
                  return val!.isEmpty?"Please Enter Value":null;
                },

                obscuringCharacter: "*",

                obscureText: showPassword,
                style: TextStyle(color: Colors.green),
                keyboardType: TextInputType.emailAddress,


                decoration: InputDecoration(
                  counterText: "skjdchj",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: IconButton(onPressed:(){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                      icon:Icon(Icons.visibility_off)),


                  hintText: "Username",
                  labelText:"Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      )
                  ),
                  errorBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,

                      )
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      )
                  ),

                ),
                onChanged: (val){
                  username= val;
                },
              ),

              FifteenDec(),
              ElevatedButton(onPressed: (){
                if(form.currentState!.validate()){
                  print(textEditingController.text);
                  print(username);

                }
                else{
                  print("Error Occure");
                }
              }, child: Text("Login"))
            ],
          ),
       )
      ),

    );
  }
}
