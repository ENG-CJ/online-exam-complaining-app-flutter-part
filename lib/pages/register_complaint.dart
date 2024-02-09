import 'package:flutter/material.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';

import '../utils/text_field.dart';

class RegisterComplaint extends StatefulWidget {
  const RegisterComplaint({super.key});

  @override
  State<RegisterComplaint> createState() => _RegisterComplaintState();
}

class _RegisterComplaintState extends State<RegisterComplaint> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
        onTap: ()=>Navigator.pop(context)
        ,child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: colors['primary'],
        title: CText(text: "Gudbi Cabashada",textHelper: CTextHelper(color: Colors.white),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomField(hintText: 'E.g Java', fielTitleTxt: 'Subjects (Based On Complaint Terms)',),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CText(text: "Use comma (,) to submit multiple subjects",textHelper: CTextHelper(
                fontsize: 14,
                color: Colors.redAccent
              ),),
            ),
            SizedBox(height: 14,),
            CustomField(hintText: 'Provide one-line Description', fielTitleTxt: 'Description *',),
            SizedBox(height: 14,),
            CustomField(hintText: 'Pending',value: "Pending", fielTitleTxt: 'Status',),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CText(text: "When We Solve, The Status May Change",textHelper: CTextHelper(
                  fontsize: 14,
                  color: Colors.redAccent
              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CButton(

                  width: 380,
                  widget: Center(child: CText(text: "Submit!",textHelper: CTextHelper(family: "Poppins Bold",color: Colors.white),),)),
            )
          ],
        ),
      ),
    );
  }
}
