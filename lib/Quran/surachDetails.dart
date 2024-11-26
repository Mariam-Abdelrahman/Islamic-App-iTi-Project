import 'package:flutter/material.dart';

class SurahDetailScreen extends StatelessWidget {
  final Map<String, dynamic> surah;

  SurahDetailScreen({required this.surah});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> ayahs = surah['ayahs'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(surah['name']),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // جعل النص يبدأ من اليمين
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // إذا كانت السورة تحتوي على البسملة كأول آية
                if (ayahs.isNotEmpty && ayahs[0]['text'].contains(
                    'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(

                      ayahs[0]['text'], // عرض البسملة
                      style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                // عرض باقي الآيات بعد البسملة
                RichText(
                  textAlign: TextAlign.justify, // محاذاة النص بشكل مبرر
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: ayahs.skip(ayahs[0]['text'].contains('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ') ? 1 : 0) // تخطي البسملة إذا كانت موجودة
                        .map((ayah) {
                      return TextSpan(
                        text:
                        '${ayah['text']} '
                            '(${ayah['numberInSurah']})  ', // عرض الآيات
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}