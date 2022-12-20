import 'package:flutter/material.dart';
import 'package:flutter_course/screens/tabs/account/account.dart';
import 'package:flutter_course/screens/tabs/home/home.dart';
import 'package:flutter_course/screens/tabs/lead/lead.dart';
import 'package:flutter_course/screens/tabs/learn/learn.dart';
import 'package:flutter_course/screens/tabs/market/Market.dart';

class AllTabs extends StatefulWidget {
  const AllTabs({Key? key}) : super(key: key);

  @override
  State<AllTabs> createState() => _AllTabsState();
}

class _AllTabsState extends State<AllTabs> {
  List<Widget> allScreen = [
    HomeScreen(),
    LeadScreen(),
    MarketScreen(),
    LearnScreen(),
    AccountScreen()
  ];

  int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (val){
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.margin,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.cast_for_education,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: ""),
        ],
      )

    );
  }
}
