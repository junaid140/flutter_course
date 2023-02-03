import 'package:flutter/material.dart';
import 'package:flutter_course/datafile.dart';
import 'package:flutter_course/main.dart';

import 'chatroom.dart';

class TabBarLecture extends StatelessWidget {
   TabBarLecture({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        // backgroundColor: Colors.black,
        drawer: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 300,
            width: 200,
            color: Colors.red,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30),
            child: Container(
              height: 70,
                width: 150,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20)
                  )
                ),
                child: ListTile(title: Text("sjdbshj"),
                subtitle: Text("sjdfbvhs"),
                leading: Icon(Icons.person),)),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Whatsapp1"),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,5,20,5),
              child: IconButton(
              onPressed: (){
                scaffoldKey.currentState!.openDrawer();
              }
              ,icon: Icon(Icons.menu)),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
                child:Text("")
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            Container(
              height: 100,
              // child: Column(
              //   children: usersList.map((user) =>   ListTile(
              //     onTap: (){
              //       print("sjbdchshj");
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userId: user["id"],)));
              //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
              //       // Navigator.pop(context);
              //     },
              //     leading: Icon(Icons.person,),
              //     title: Text(user["username"],),
              //     subtitle: Text("subtitle"),
              //     trailing: Text("04:00 PM"),
              //
              //   ),).toList(),
              // ),
              child: ListView.builder(
                itemCount: usersList.length,
                  itemBuilder:(context,index){
                 return ListTile(
                 onTap: (){
                  print("sjbdchshj");
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userId: usersList[index]["id"],)));
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChatRoom()));
                  // Navigator.pop(context);
                  },
                  leading: Icon(Icons.person,),
                  title: Text(usersList[index]["username"],),
                  subtitle: Text("subtitle"),
                  trailing: Text("04:00 PM"),

                  );
                       }),
                    ),
                    Home(),
                    SizedBox(
                    height: 100,
                    child: RichText(
                    text: TextSpan(
                    children: [
                    TextSpan( text: "hello",
                    style: TextStyle(
                    ),), TextSpan( text: "h",

                    style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color: Colors.blue
                    ),), TextSpan( text: "hhjhhjbdhscbj",
                    style: TextStyle(
                    ),), TextSpan( text: "hhjhhjbdhscbj",
                    style: TextStyle(
                    fontWeight:FontWeight.bold
                        ),),
                  ],

                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
          alignment: Alignment.center,
          child:  TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
                // text: "chat",
              ),
              Tab(text: "status",),
              Tab(text: "call",)
            ],
          ),
        ),

      ),
    );
  }
}
