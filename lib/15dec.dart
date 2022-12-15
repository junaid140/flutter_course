//check Box
//Radio Button
//DatePicker
//DropdownMenu
//PopUpMenu

import 'package:flutter/material.dart';
import 'package:flutter_course/tab_bar_lecture.dart';
class FifteenDec extends StatefulWidget {
  const FifteenDec({Key? key}) : super(key: key);

  @override
  State<FifteenDec> createState() => _FifteenDecState();
}

class _FifteenDecState extends State<FifteenDec> {
  bool isChecked = false;

  String? selectedGender;
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Checkbox(value: isChecked, onChanged: (value){
              print(value);

              setState(() {
                isChecked = value!;
              });
              print("is clicked $isChecked");

            }),
            CheckboxListTile(
                title:Text("Option one" ),
                value: isChecked, onChanged: (value){
              print(value);

              setState(() {
                isChecked = value!;
              });
              print("is clicked $isChecked");

            }),
            // DatePickerDialog(
            //     initialDate: DateTime.now(), firstDate: DateTime(2000),
            //     lastDate: DateTime(2030)
            // ),

            PopupMenuButton(
                onSelected: (val){
                  if(val=="read"){
                    Navigator.push(context,MaterialPageRoute(builder:
                        (context)=> TabBarLecture()));
                  }
                },
                itemBuilder: (context,){
              return [
                PopupMenuItem(child: Text("Read"),value: "read",),
                PopupMenuItem(child: Text("Delete"),value: "delet",),
              ];
            }),
            DropdownButton(
              value: dropDownValue,
                hint: Text("Please Selcted City"),
                items: [
              DropdownMenuItem(
                  value: "Multan",
                  child: Text("Multan")),
              DropdownMenuItem(
                  value: "Lahore",
                  child: Text("Lahore")),
            ], onChanged: (val){
                setState(() {
                  dropDownValue = val;
                });
            }),

            ExpansionTile(title: Text("Expansion tile"),
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                      itemCount:gender.length ,
                      itemBuilder: (context,index) {
                        return Row(
                          children: [
                            Radio(value: gender[index], groupValue: selectedGender,
                                onChanged: (val){
                                  print(val);
                                  if(selectedGender==null){
                                    setState(() {
                                      selectedGender = val;
                                    });
                                  }
                                  else{
                                    print("already Selected");
                                  }
                                }),
                            Text(gender[index]),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),



            // Row(
            //   children: [
            //     Radio(value: "female", groupValue: selectedGender, onChanged: (val){
            //       print(val);
            //       setState(() {
            //         selectedGender = val;
            //       });
            //     }),
            //     Text("Female")
            //   ],
            // ),
            // Row(
            //   children: [
            //     Radio(value: "other", groupValue: selectedGender, onChanged: (val){
            //       print(val);
            //       setState(() {
            //         selectedGender = val;
            //       });
            //     }),
            //   Text("Other")
            //   ],
            // ),

          ],
        ),
      ),

    );
  }
}

List gender =["male","female","other" ];