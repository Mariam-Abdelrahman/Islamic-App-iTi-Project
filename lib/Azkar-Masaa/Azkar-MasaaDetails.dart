







import 'package:flutter/material.dart';

import 'DataProvider.dart';

class AzkarMasaaDetails extends StatelessWidget {


  final AzkarMasaaData azkarMasaaData = AzkarMasaaData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('أذكار المساء',
          style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<Map>(
        future: azkarMasaaData.loadazkarMasaaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final Map AzkarMasaa = (snapshot.data??{}) ;
            return ListView.builder(
              itemCount: AzkarMasaa['content'].length,
              itemBuilder: (context, index) {
                final String zekr =
                AzkarMasaa['content'][index]['zekr'] ;
                final int repeat =
                AzkarMasaa['content'][index]['repeat'] ;

                final String bless =
                AzkarMasaa['content'][index]['bless'];




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