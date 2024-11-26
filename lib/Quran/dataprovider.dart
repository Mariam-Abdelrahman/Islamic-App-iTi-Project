import 'dart:convert';
import 'package:flutter/services.dart';

class QuranDataProvider {
  Future<Map<String, dynamic>> loadQuranData() async {
    try {
      final String response = await rootBundle.loadString(
          'assets/json/quran.json');
      final data = json.decode(response);
      print('Started loading JSON');
      print('Data loaded successfully: $data');

      return data;
    } catch (e) {
      print('Error loading JSON: $e');
      throw Exception('Error loading data');
    }
  }
}