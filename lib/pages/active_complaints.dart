import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/pages/comaplain.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';

class ActiveComplaints extends StatelessWidget {
  const ActiveComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 15,right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(children: [ SizedBox(width: 45,height: 45,child: Image.asset("assets/logo.png")),
                   SizedBox(width: 10,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CText(text: "Abdulrahman",textHelper: CTextHelper(fontsize: 19,fontWeight: FontWeight.bold,family: "Poppins Bold"),),
                       CText(text: "Student")
                     ],
                   )],),
                  FaIcon(FontAwesomeIcons.angleRight)

                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  boxShadow: [

                    BoxShadow(
                      color: Color(0xFFbec1e5).withOpacity(1),
                      offset: Offset(4, -4),
                      blurRadius: 29,
                      spreadRadius: -8,
                    ),

                  ],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    SizedBox(height: 18,),
                    Image.asset("assets/banner.png"),
                    SizedBox(height: 10,),
                    CText(text: "Active Complaints",textHelper: CTextHelper(fontsize: 17,family: "Poppins Bold"),),
                    CText(text: "Here is Active Exam Complaints",textHelper: CTextHelper(fontsize: 10,family: "Poppins Light")),
                    SizedBox(height: 10,),
                    Chip(label: CText(text: "Cabashada MidTerm-ka  ")),
                    Chip(label: CText(text: "InActive Date: 12/2/2023")),
                    SizedBox(height: 10,),
                    CButton(
                      onClick: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>ComplainPage())),
                        width: 180,
                        widget: Center(child: CText(text: "More",textHelper: CTextHelper(fontsize: 17,family: "Poppins Bold",color: Colors.white)),))

                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
