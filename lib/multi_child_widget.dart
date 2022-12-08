import 'package:flutter/material.dart';

class MultiChildWidget extends StatelessWidget {
  int? userId ;
   MultiChildWidget({Key? key,this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        // height: MediaQuery.of(context).size.height,
        // width: double.infinity,
        child: customProfileStack(),
        // child: customStack(),

        // child: GridView.builder(
        //   itemCount: chatData.length,
        //   itemBuilder: (context,index){
        //     print(index);
        //     return  Align(
        //         alignment: chatData[index]["send_by"]==userId?Alignment.centerLeft:Alignment.centerRight,
        //         child: customChatMessageTile(chatData[index]["message"]));
        //   }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 3,
        //   childAspectRatio:1.23,
        //   crossAxisSpacing: 5,
        // ),
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        // //   scrollDirection: Axis.horizontal,
        // //   child:SingleChildScrollView(
        //     // scrollDirection: Axis.horizontal,
        //     // child: Row(
        //     // child:Column(
        //     // child:Wrap(
        // // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // //     crossAxisAlignment: CrossAxisAlignment.end,
        // //     children: chatData.map((data) => ).toList()
        // ),

          ),
      );
  }

  Widget customChatMessageTile(text){
    return  Container(
      // height: 50,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 8,
          top: 8,bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue,width: 2.0)
      ),
      child: Column(
        children: [

          Text("UserName,"),
          Text("$text"),
        ],
      ),);
  }

  Widget customStack(){
   return  Stack(
     children: [
       Container(height: 400,width:300 ,color: Colors.red,),
       Container(height: 200,width:300 ,color: Colors.black,),
       Align(
           alignment: Alignment.bottomCenter,
           child: Container(height: 100,width:300 ,color: Colors.blue,)),
       Positioned(
         bottom: 50,
           right: 50,
           child: Icon(Icons.person)),

     ],
   );
  }
  Widget customProfileStack(){
   return  Container(
     height: 200,width:200,
     child: Stack(

       children: [
         Container(height: 200,width:200 ,decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.white,boxShadow: [
             BoxShadow(color: Colors.black12,blurRadius: 20)]

         ),),

         Positioned(
           bottom: 20,
             right: 10,
             child: Icon(Icons.camera_alt)),

       ],
     ),
   );
  }

}
