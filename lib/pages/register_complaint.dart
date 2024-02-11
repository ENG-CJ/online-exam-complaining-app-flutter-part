import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/local/local_storage.dart';
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
  GlobalKey<FormState> _forkey = GlobalKey<FormState>();
  String? subjects;
  String? description;
  String status = 'pending';
  var std_id = '';

  void initState (){
    LocalStorage().getLocalDataValue('id').then((value) => {
      setState( () {
        std_id = value;
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: colors['primary'],
        title: CText(
          text: "Gudbi Cabashada",
          textHelper: CTextHelper(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _forkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'Subjects (Based On Complaint Terms)',
                      style: GoogleFonts.poppins( fontSize: 14),
                    ),
                  ),
                  Gap(5),
                  TextFormField(
                    validator: (val) {
                      if(val != null){
                        if(val.isEmpty) return 'subjects is required';
                      }
                    },
                    onSaved: (newVal) => subjects = newVal,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      // labelText: 'Subjects (Based On Complaint Terms)',
                      hintText: 'eg. java , php , python',
                      fillColor: Colors.white54,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        letterSpacing: 2,
                        color: colors['error'],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(int.parse("0xff3652AD")),
                          )),
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  Gap(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'Use comma (,) to submit multiple subjects',
                      style: GoogleFonts.poppins( fontSize: 14, color: colors['error']),
                    ),
                  ),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'Description',
                      style: GoogleFonts.poppins( fontSize: 14),
                    ),
                  ),
                  Gap(5),
                  TextFormField(
                    validator: (val) {
                      if(val != null){
                        if(val.isEmpty) return 'description is required';
                      }
                    },
                    onSaved: (newVal) => description = newVal,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Provide one-line Description',
                      fillColor: Colors.white54,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorStyle: GoogleFonts.poppins(
                        fontSize: 13,
                        letterSpacing: 2,
                        color: colors['error'],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(int.parse("0xff3652AD")),
                          )),
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      'Status',
                      style: GoogleFonts.poppins( fontSize: 14),
                    ),
                  ),
                  Gap(5),
                  TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                    readOnly: true,
                    initialValue: status,
                    decoration: InputDecoration(
                      fillColor: Colors.white54,
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(int.parse("0xff3652AD")),
                          )),
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ),
                  Gap(20),
                  GestureDetector(
                    onTap: (){
                      _forkey.currentState!.save();
                      if(_forkey.currentState!.validate()){
                        var splitSubjects = subjects!.split(",");
                        if( splitSubjects.length > 4 ){
                            CoolAlert.show(
                              context: context,
                              type: CoolAlertType.info,
                              text: "subject length must be less than 4",
                            );
                        }{
                            var joinSubjects = splitSubjects.join(',');
                            print("join subjects $joinSubjects");
                            print("sending data $joinSubjects! , $description! , $std_id! , $status");
                        }
                      }
                    },
                    child: CButton(
                      width: 380,
                      widget: Center(
                        child: CText(
                          text: "Submit!",
                          textHelper: CTextHelper(
                              family: "Poppins Bold", color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
