import 'package:flutter/material.dart';

import 'DataProvider.dart';



class Ad3ya extends StatelessWidget {


  final  DoaaData Ad3yaData =  DoaaData ();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('مائة دعاء من القران والسنة',
          style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<List>(
        future: Ad3yaData .loadDoaaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final List Doaas = (snapshot.data??[]) ;
            return ListView.builder(
              itemCount: Doaas .length,
              itemBuilder: (context, index) {
                final String description =Doaas[index]['category'] ;
                final h =Doaas[index]['duaa'][0];


                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    title: Text(description,style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),),
                    subtitle: Text(h,style: TextStyle(
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