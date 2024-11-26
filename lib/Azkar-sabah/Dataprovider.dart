import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarSabahData {
  Future<Map> loadazkarsabahData() async {
    try {
      final String response =
      await rootBundle.loadString(
          'assets/json/azkar-sabah.json');
      final Map data = json.decode(response);

      print('Started loading JSON');
      print('Data loaded successfully: $data');

      return data;
    } catch (e) {
      print('Error loading JSON: $e');
      throw Exception('Error loading data');
    }
  }
}