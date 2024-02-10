import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:online_exam_conmplaining_app/models/terms.dart';

import '../const/url.dart';

class TermsProvider extends ChangeNotifier{
  Terms? _terms;
  Future<Terms?> fetchActiveComplainTerms() async {
    // try {
    FormData formData = FormData();

    // Add fields to the form data
    formData.fields.add(const MapEntry('action', "read_all_complain_terms_api"));
    var response = await Dio().post('${URL}complain_terms.api.php', data:formData);

    // var encodeData = jsonDecode(response.data);
    if (response.data['status']) {
      if (response.data['data'].length>0) {
        _terms = Terms.fromJson((response.data['data'] as List).first);
      }
    }
    // } catch (error) {
    //   print("Failed to login $error");
    // }
    return _terms;
  }
}