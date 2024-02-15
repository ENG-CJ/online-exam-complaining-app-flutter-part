import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_exam_conmplaining_app/const/url.dart';

import '../models/my_complain.dart';

class Complains extends ChangeNotifier {
  create_complain(String subjects, String description, String std_id,
      String status, BuildContext context) async {
    try {
      FormData formData = FormData();
      formData.fields.add(MapEntry('subjects', subjects));
      formData.fields.add(MapEntry('std_id', std_id));
      formData.fields.add(MapEntry('description', description));
      formData.fields.add(MapEntry('status', status));
      formData.fields.add(const MapEntry("action", "create_complain_api"));
      var response = await Dio().post("${URL}complain.api.php", data: formData);
      var data = response.data;
      if (data['status']) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: data['data'],
        );
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: data['data'],
        );
      }
    } catch (error) {
      throw Exception(
          "Failed to register complains. Please try again later. $error");
    }
  }

//  fetching single complain with studentID
  Future<MyComplain?> fetchSingleComplainWithStudent(String id) async {
    FormData formData = FormData();
    formData.fields.add(MapEntry('id', id));
    formData.fields
        .add(const MapEntry('action', "readSingleComplainWithStudent"));

    var response = await Dio().post('${URL}complain.api.php', data: formData);
    var convertResponseAsList = (response.data['data'] as List);
    if (convertResponseAsList.length == 0) return null;
    var latestComplain = MyComplain.fromJson(convertResponseAsList.first);

    return latestComplain;
  }
}
