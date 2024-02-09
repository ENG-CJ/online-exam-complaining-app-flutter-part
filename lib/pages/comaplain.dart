import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/pages/register_complaint.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/terms.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';

class ComplainPage extends StatelessWidget {
  const ComplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 19, left: 19),
            child: Row(
              children: [
                InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 21,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                CText(
                  text: "Exam Complain",
                  textHelper: CTextHelper(family: "Poppins Bold"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CText(
              text: "Important Statements!",
              textHelper: CTextHelper(
                  fontsize: 19,
                  family: "Poppins Bold",
                  color: colors['warning'] as Color),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CText(
                textHelper: CTextHelper(fontsize: 12, family: "Poppins Light"),
                text:
                    "Based on the given terms, your complaint must be taken into consideration."),
          ),
          Divider(
            indent: 10,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                    text: "Terms",
                    textHelper: CTextHelper(family: "Poppins SemiBold")),
                CText(
                    text: "Description",
                    textHelper: CTextHelper(family: "Poppins SemiBold")),
              ],
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TermsDescriptions(
             term: "Start Date",
               description: "12/2/2023",
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CText(text: "More About!"),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CText(text: "This is about descrion shjksa sakjska Based on the given terms, your complaint must be taken into consideration."),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: CButton(
              onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterComplaint())),
              width: double.maxFinite,
                widget: Center(
                    child: CText(
              text: "Make Complaint",
              textHelper: CTextHelper(
                  color: Colors.white, fontsize: 15, family: "Poppins Bold"),
            ))),
          )
        ],
      )),
    );
  }
}
