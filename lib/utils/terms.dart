import 'package:flutter/material.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';

import 'text.dart';

class TermsDescriptions extends StatelessWidget {
  final String term, description;
  const TermsDescriptions(
      {super.key, required this.term, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CText(text: term,textHelper: CTextHelper(family: "Poppins Bold",fontsize: 14,color: colors['secondary'] as Color),),
        CText(text: description,textHelper: CTextHelper(family: "Poppins Bold", fontsize: 14),),
      ],
    );
  }
}
