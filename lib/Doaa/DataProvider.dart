


import 'dart:convert';

import 'package:flutter/services.dart';
class DoaaData {
  Future<List> loadDoaaData() async {
    try {
      final String response =
      await rootBundle.loadString(
          'assets/json/Doaa.json');
      final List data = json.decode(response);

      print('Started loading JSON');
      print('Data loaded successfully: $data');

      return data;
    } catch (e) {
      print('Error loading JSON: $e');
      throw Exception('Error loading data');
    }
  }
}