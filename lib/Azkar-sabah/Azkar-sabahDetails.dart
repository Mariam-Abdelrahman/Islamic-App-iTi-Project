import 'package:flutter/material.dart';

import 'Dataprovider.dart';
class AzkarSabahDetails extends StatelessWidget {


  final AzkarSabahData azkarSabahData = AzkarSabahData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('أذكار الصباح',
          style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<Map>(
        future: azkarSabahData.loadazkarsabahData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final Map AzkarSabah = (snapshot.data??{}) ;
            return ListView.builder(
              itemCount: AzkarSabah['content'].length,
              itemBuilder: (context, index) {
                final String zekr =
                AzkarSabah['content'][index]['zekr'] ;
                final int repeat =
                AzkarSabah['content'][index]['repeat'] ;

                final String bless =
                AzkarSabah['content'][index]['bless'];




                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                   title : Text(zekr,style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),),
                    subtitle: Text(bless,style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,

                    ),),
                    trailing:CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Text('$repeat',style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      
                      ),),
                    ),


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