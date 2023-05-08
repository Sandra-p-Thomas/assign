import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final dynamic item;
  ItemDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
        title: Text('${item['first_name']} ${item['last_name']}'),titleTextStyle:  TextStyle(
        letterSpacing: 5,color: Colors.white
      ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15,),

            Center(child:
            CircleAvatar(
              backgroundImage: NetworkImage(item['avatar']),
              radius: 100,
            ),),
            SizedBox(height: 20),
           Row(children: [
             SizedBox(width: 10,),
           Text("Name :",  style:  TextStyle(
              letterSpacing: 5,fontWeight: FontWeight.bold),),
            Text('${item['email']}',  style:  TextStyle(
              letterSpacing: 5,
            ),),]),
          ],
        ),

    );
  }
}
