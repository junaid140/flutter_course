//datatable
//font change
//google font
//custom bottom navigation bar

//data_table_2
//horizontal_data_table
//expandable_datatable


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckFont extends StatefulWidget {
   CheckFont({Key? key}) : super(key: key);

  @override
  State<CheckFont> createState() => _CheckFontState();
}

class _CheckFontState extends State<CheckFont> {
   List screens =[
     Text("Page1"),
     Text("page2"),
     Text("Page3"),
     Text("Page4"),
     Text("Page5"),
     Text("Page5"),
   ];

   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text(
            "Hello Font"
            ,style: GoogleFonts.akronim()
          ),
        ),
      ),
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(height: 2,color: selectedIndex==0?Colors.blue:Colors.transparent,
                  width: 50,
                  child: Text(""),
                ),                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex =0;
                    });
                  },
                  icon: Icon(Icons.home,color: selectedIndex==0?Colors.blue:Colors.black,),),
              ],
            ),
            Column(
              children: [
                Container(height: 2,color: selectedIndex==1?Colors.blue:Colors.transparent,
                  width: 50,
                  child: Text(""),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex =1;
                    });
                  },
                  icon: Icon(Icons.chat,color: selectedIndex==1?Colors.blue:Colors.black),),
              ],
            ),
            Column(
              children: [
                Container(height: 2,color: selectedIndex==2?Colors.blue:Colors.transparent,
                  width: 50,
                  child: Text(""),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex =2;
                    });
                  },
                  icon: Icon(Icons.person,color: selectedIndex==2?Colors.blue:Colors.black),),
              ],
            ),
            Column(
              children: [
                Container(height: 2,color: selectedIndex==3?Colors.blue:Colors.transparent,
                  width: 50,
                  child: Text(""),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex =3;
                    });
                  },
                  icon: Icon(Icons.access_alarm_outlined,color: selectedIndex==3?Colors.blue:Colors.black),),
              ],
            ),
            Column(
              children: [
                Container(height: 2,color: selectedIndex==4?Colors.blue:Colors.transparent,
                width: 50,
                child: Text(""),
                ),

                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex =4;
                    });
                  },
                  icon: Icon(Icons.accessibility,color: selectedIndex==4?Colors.blue:Colors.black),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List users = [
    {"id":1,"name":"Test User","cnic":"123345667879"},
    {"id":2,"name":"Test User2","cnic":"123345667879"},
    {"id":2,"name":"Test User3","cnic":"123345667879"},
  ];
}
