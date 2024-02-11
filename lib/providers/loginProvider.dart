import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_conmplaining_app/const/url.dart';
import 'package:online_exam_conmplaining_app/models/students.dart';

class Loginprovider extends ChangeNotifier {
  Students? students;

  Future<Students?> login(String username, String password) async {
    try {
      FormData formData = FormData();
      // Add fields to the form data
      formData.fields.add(MapEntry('id', username));
      formData.fields.add(MapEntry('password', password));
      formData.fields.add(const MapEntry('action', "Login"));

      var response = await Dio().post('${URL}student.api.php', data: formData);
      var encodeData = jsonDecode(response.data);
      if (encodeData['status']) {
        if (encodeData['data'].length > 0) {
          students = Students.fromJson((encodeData['data'] as List).first);
          return students;
        } else {
          throw Exception("No data found");
        }
      } else {
        throw Exception("Login failed: ${encodeData['message']}");
      }
    } catch (error) {
      print("Failed to login: $error");
      throw Exception("Failed to login. Please try again later.");
    }
  }
}
