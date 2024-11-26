import 'package:flutter/material.dart';

class Masbah extends StatefulWidget {



  @override
  State<Masbah> createState() => _MasbahState();
}

class _MasbahState extends State<Masbah> {
  int c1=0;
  int c2=0;
  int c3=0;
  int c4=0;
  int c5=0;
  int c6=0;
  int c7=0;
  int c8=0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text("المسبحة الالكترونية",
            style: TextStyle(color: Colors.white,
            fontSize: 25),),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView (
            child: Column(
              children: [
               RawWidget(
                   text1: "لا اله الا الله ",

                   counter: c1,
                 increase: (){c1++;
                     setState(() {
                     });},
                 reset: (){c1=0;
                 setState(() {
                 });},


               ),
                RawWidget(
                  text1: "سبحان الله ",
                  counter: c2,
                  increase: (){c2++;
                  setState(() {
                  });},
                  reset: (){c2=0;
                  setState(() {
                  });},


                ),
                RawWidget(
                  text1: "الله اكبر",
                  counter: c3,
                  increase: (){c3++;
                  setState(() {
                  });},
                  reset: (){c3=0;
                  setState(() {
                  });},


                ),
                RawWidget(
                  text1:
                  " استغفر الله ",
                  counter: c4,
                  increase: (){c4++;
                  setState(() {
                  });},
                  reset: (){c4=0;
                  setState(() {
                  });},


                ),
                RawWidget(
                  text1:
                  " الحمد لله ",
                  counter: c5,
                  increase: (){c5++;
                  setState(() {
                  });},
                  reset: (){c5=0;
                  setState(() {
                  });},


                ),
                RawWidget(
                  text1:
                  " صلي علي محمد ",
                  counter: c6,
                  increase: (){c6++;
                  setState(() {
                  });},
                  reset: (){c6=0;
                  setState(() {
                  });},
                ),
                RawWidget(
                  text1:
                  " سبحان الله وبحمده ",
                  counter: c7,
                  increase: (){c7++;
                  setState(() {
                  });},
                  reset: (){c7=0;
                  setState(() {
                  });},


                ),
                RawWidget(
                  text1:
                  " سبحان الله العظيم ",
                  counter: c8,
                  increase: (){c8++;
                  setState(() {
                  });},
                  reset: (){c8=0;
                  setState(() {
                  });},


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RawWidget extends StatelessWidget {
  String text1;

  int counter;
  Function() increase;
  Function() reset;
   RawWidget({
     required this.text1,

     required this.counter,
     required this.increase,
     required this.reset,

  });

  @override

  Widget build(BuildContext context) {
    return Row(



      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(text1,textAlign: TextAlign.right,
             style: TextStyle(
             fontSize: 25,color: Colors.black
           ),) ,

          ],
        ),
        Spacer(),
        InkWell(
          onTap: increase,


          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 35,
              child: Text("${counter}",style: TextStyle(
                fontSize: 30,color: Colors.white),),
            ),
          ),
        ),
        InkWell(
          onTap:reset,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Text("R",style: TextStyle(
              fontSize: 25,color: Colors.white
            ),),
          ),
        )

      ],
    );

  }
}
