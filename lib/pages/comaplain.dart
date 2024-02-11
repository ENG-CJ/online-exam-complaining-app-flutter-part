import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/models/terms.dart';
import 'package:online_exam_conmplaining_app/pages/register_complaint.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/terms.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';
import 'package:intl/intl.dart';

class ComplainPage extends StatefulWidget {
  final Terms? terms;

  const ComplainPage({super.key, this.terms});

  @override
  State<ComplainPage> createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors['primary'],
        title: CText(
          text: "Exam Complain",
          textHelper: CTextHelper(family: "Poppins Bold", color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(
                text: "Important Statements!",
                textHelper: CTextHelper(
                    fontsize: 19,
                    family: "Poppins Bold",
                    color: colors['warning'] as Color),
              ),
              Gap(15),
              Text("Based on the given terms, your complaint must be taken into consideration.",
                style: GoogleFonts.poppins(fontSize: 14, height: 2),textAlign: TextAlign.center,),
              Divider(
                indent: 4,
              ),
              Gap(15),
              Row(
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
              Divider( indent: 4,),
              Gap(10),
              TermsDescriptions(
                term: "Start Date",
                description:
                    DateFormat("yyyy-MM-dd").format(widget.terms!.startDate),
              ),
              Gap(10),
              TermsDescriptions(
                term: "End Date",
                description:
                    DateFormat("yyyy-MM-dd").format(widget.terms!.expireDate),
              ),
              Gap(10),
              TermsDescriptions(
                term: "Subject Length",
                description:
                    "${widget.terms!.subjectLength.toString()} Subject Minimum",
              ),
              Gap(10),
              TermsDescriptions(
                term: "Status",
                description:
                    "${widget.terms!.status.toString() == "yes" ? "Activated" : "Not Active"}",
              ),
              Gap(10),
              TermsDescriptions(
                term: "Exam Type",
                description: widget.terms!.examType.toString(),
              ),
              Gap(10),
              Text('${widget.terms!.description}',
                style: GoogleFonts.poppins(fontSize: 14, height: 2),textAlign: TextAlign.center,),
              Gap(10),
              CButton(
                  onClick: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterComplaint())),
                  width: double.maxFinite,
                  widget: Center(
                      child: CText(
                    text: "Make Complaint",
                    textHelper: CTextHelper(
                        color: Colors.white,
                        fontsize: 15,
                        family: "Poppins Bold"),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
