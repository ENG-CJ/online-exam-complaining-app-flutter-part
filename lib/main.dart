import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/pages/active_complaints.dart';
import 'package:online_exam_conmplaining_app/pages/comaplain.dart';
import 'package:online_exam_conmplaining_app/pages/login.dart';
import 'package:online_exam_conmplaining_app/pages/register_complaint.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colors['primary'],systemNavigationBarColor: colors['primary']));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: const ActiveComplaints(),
    );
  }
}

