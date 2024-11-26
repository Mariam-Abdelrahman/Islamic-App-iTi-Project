
import 'package:flutter/material.dart';

import 'dataprovider.dart';
class Ahadeeth extends StatelessWidget {
  final  AhadeethData ahadeethData = AhadeethData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('الأربعون النووية',
        style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<List>(
        future: ahadeethData.loadahadeethData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final List hadeeth = (snapshot.data??[]) ;
            return ListView.builder(
              itemCount: hadeeth.length,
              itemBuilder: (context, index) {
                final String description = hadeeth[index]['description'] ;
                final h = hadeeth[index]['hadith'];


                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    subtitle: Text(description,style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),),
                    title: Text(h,style: TextStyle(
                      fontSize: 22,
                      color: Colors.blueGrey,

                    ),),


                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}