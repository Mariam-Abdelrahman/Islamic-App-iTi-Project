import 'package:finalproject/Doaa/DoaaDetails.dart';
import 'package:finalproject/Masbaha/MasbahDetails.dart';
import 'package:finalproject/Pages/Azkers.dart';
import 'package:flutter/material.dart';

import '../Hadith/HadithDetails.dart';
import '../Quran/ShowListOfQuran.dart';

class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
            
            
                  decoration: BoxDecoration(
            
                    image:DecorationImage(
                        image: AssetImage("assets/images/f3.jpg")
                        ,fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(height: 15,),
            
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
            
                    Expanded(child: columnwidget(
                      Event: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c){
                              return SurahListScreen();
                            }));
                      },
                      text:"القرءان الكريم",
                      image:"assets/images/f4.jpg", )),
                    SizedBox(width: 15,),
            
            
                    Expanded(child: columnwidget(
                      Event: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c){
                              return Ahadeeth();
                            }));
                      },
                      text:
                    "الأربعون النووية",image:"assets/images/f5.jpg", )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: columnwidget(
                          text: "الاذكار",
                          image:"assets/images/f7.jpg",
                          Event:(){
                Navigator.of(context).push(
                MaterialPageRoute(builder: (c){
                return Azkers();
                }));
                },
            
                      ),
            
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: columnwidget(
                        text: "الادعية",
                        image:"assets/images/f8.jpg",
                        Event:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (c){
                                return Ad3ya();
                              }));
            
                        },),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c){
                              return Masbah();
                            }));
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                        AssetImage("assets/images/f6.jpg"),
                      ),
                    ),
                    Text("المسبحة",
                      style: TextStyle(color: Colors.white
                      ,fontSize: 25),)
                  ],
                )
                
                
              ],
            ),
          ),
        ),
      ),

    );
  }
}

class columnwidget extends StatelessWidget {
  String text;
  String image;
  Function() Event;

   columnwidget({
    required this.text,required this.image,
     required this.Event

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: Event,
          child: Container(
            height: 150,

            decoration: BoxDecoration(

              image:DecorationImage(
                image: AssetImage(image)
                ,fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(30),
            ),

          ),
        ),
        Text(text,style:
        TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
        color: Colors.white),),
      ],
    );
  }
}
