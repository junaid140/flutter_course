//pdf viewer
//qr code
//share plus

//chilpboard


//syncfusion.com 14-15 packages
//fl_chart
//draggable_bottom_sheet



//custom_selectable_text

import 'package:clipboard/clipboard.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';

class Dec28Lecture extends StatefulWidget {
  const Dec28Lecture({Key? key}) : super(key: key);

  @override
  State<Dec28Lecture> createState() => _Dec28LectureState();
}

class _Dec28LectureState extends State<Dec28Lecture> {


   String value ="Hello Flutter" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Hello Flutter", ),
        actions: [IconButton(onPressed: (){
          Share.text('my text title',
              'This is my text to share with other applications.',
              'text/plain');
        }, icon: Icon(Icons.share))],
      ),
      body: Center(
        child: GestureDetector(
            onTap: (){
              FlutterClipboard.copy('$value').then(( value ) => print('copied'));
            },
            child: Text(value)),
      ),

    );
  }
}
