
import 'package:flutter/material.dart';

import 'DataProvider.dart';
class PostPrayerZker extends StatelessWidget {
  final PostPrayer post = PostPrayer();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('أذكار بعد الصلاة ',
          style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<Map>(
        future:post.loadpostprayer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final Map postprayer = (snapshot.data??{}) ;
            return ListView.builder(
              itemCount: postprayer['content'].length,
              itemBuilder: (context, index) {
                final String zekr =
                postprayer['content'][index]['zekr'] ;
                final int repeat =
                postprayer['content'][index]['repeat'] ;
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    title : Text(zekr,style: TextStyle(
                      fontSize: 20,
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