import 'package:finalproject/Quran/surachDetails.dart';
import 'package:flutter/material.dart';

import 'dataprovider.dart';


class SurahListScreen extends StatelessWidget {
  final QuranDataProvider dataProvider = QuranDataProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('سور القران الكريم',
        style: TextStyle(color: Colors.white),)),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: dataProvider.loadQuranData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final Map<String, dynamic> surahData = snapshot.data?['data'] ?? {};
            final List<dynamic> surahList = surahData['surahs'] ?? [];

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: surahList.length,
                itemBuilder: (context, index) {
                  final surah = surahList[index];
                  final ayahs = surah['ayahs'] as List<dynamic>? ?? [];
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      title: Text(surah['name'],style:
                      TextStyle(fontSize: 22),),
                      subtitle: Text(' عدد الآيات :${ayahs.length}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahDetailScreen(surah: surah),
                          ),
                        );
                      },

                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}