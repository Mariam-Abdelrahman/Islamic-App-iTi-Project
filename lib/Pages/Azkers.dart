import 'package:finalproject/Azkar-Masaa/Azkar-MasaaDetails.dart';
import 'package:flutter/material.dart';

import '../Azkar-sabah/Azkar-sabahDetails.dart';
import '../PostPrayer-Azkar/PostPrayer-AzkarDetails.dart';
import 'HomePage.dart';

class Azkers extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: columnwidget(
                        text: "أذكار الصباح",
                        image: "assets/images/f9.jpg",
                        Event: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (c){
                                return AzkarSabahDetails();
                              }));
                        }),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: columnwidget(
                        text: "أذكار المساء",
                        image: "assets/images/f10.jpg",
                        Event: (){ Navigator.of(context).push(
                            MaterialPageRoute(builder: (c){
                              return AzkarMasaaDetails();
                            }));}),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              columnwidget(
                  text:"أذكار بعد الصلاة",
                  image: "assets/images/f11.jpg",
                  Event: (){
    Navigator.of(context).push(
    MaterialPageRoute(builder: (c){
    return PostPrayerZker();
    }));}
                  )



            ],
          ),
        ),
      ),

    );
  }
}
