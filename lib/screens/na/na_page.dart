import 'package:flutter/material.dart';

class NAPage extends StatefulWidget {
  const NAPage({Key? key}) : super(key: key);

  @override
  State<NAPage> createState() => _NAPageState();
}

class _NAPageState extends State<NAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NA Page"),
      ),
    );
  }
}
