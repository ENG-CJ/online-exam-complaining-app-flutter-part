import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_conmplaining_app/const/url.dart';
import 'package:online_exam_conmplaining_app/models/students.dart';


class Loginprovider extends ChangeNotifier {
  Students? students ;
  login(String username , String password )async{
    try{
      String id = username;
      var response = await Dio().post('${URL}user.api.php/$id/$password');
      if(response.data['status']){
        if(response.data['data'] > 0 ){
          var jsonData = jsonDecode(response.data['data']);
          students = Students.fromJson(jsonData);
        }
      }
    }catch(error){
      print("Failed to login $error");
    }
  }
}