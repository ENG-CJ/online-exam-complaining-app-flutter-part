import 'package:flutter/material.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';

class CText extends StatelessWidget {
  final String text;
  final CTextHelper? textHelper;
  const CText({super.key, this.textHelper,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(
     text,
      style: TextStyle(
        fontSize: textHelper?.fontsize,
        fontFamily: textHelper?.family,
        color: textHelper?.color,
      ),
    );
  }
}
