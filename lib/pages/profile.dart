import 'package:alert_dialog/alert_dialog.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_exam_conmplaining_app/models/my_complain.dart';
import 'package:online_exam_conmplaining_app/models/students.dart';
import 'package:online_exam_conmplaining_app/pages/login.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../providers/complain_provider.dart';

class Profile extends StatefulWidget {
  final void Function()? onLoad;
  final Students? profileData;
  const Profile({super.key, this.onLoad, this.profileData});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  MyComplain? latestComplain;
  bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Complains>(context,listen: false).fetchSingleComplainWithStudent("C23001").then((value) {
     setState(() {
       latestComplain=value;
       isLoading=false;
     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        leading: InkWell(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.white)),
        centerTitle: true,
        title: CText(text: "My Profile",textHelper: CTextHelper(color: Colors.white),),
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 17,),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 61.0,
                      backgroundImage: AssetImage('assets/logo.png'),
                      backgroundColor: colors['primary']!.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: CText(
                    text: widget.profileData!.name!,
                  textHelper: CTextHelper(fontsize: 19),
                   ),
              ),
              SizedBox(
                height: 7,
              ),
              Center(
                child: CText(
                  text: widget.profileData!.id!,
                  textHelper: CTextHelper(fontsize: 17),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CText(text: "Class",textHelper: CTextHelper(family: "Poppins Bold",fontsize: 18),),
                      CText(text: widget.profileData!.className!,textHelper: CTextHelper(family: "Poppins Light",fontsize: 13),),
                    ],
                  ),
                  Column(
                    children: [
                      CText(text: "Semester",textHelper: CTextHelper(family: "Poppins Bold",fontsize: 18),),
                      CText(text: widget.profileData!.semester!.split(" ")[1],textHelper: CTextHelper(family: "Poppins Light",fontsize: 13),),
                    ],
                  ),
                  Column(
                    children: [
                      CText(text: "Status",textHelper: CTextHelper(family: "Poppins Bold",fontsize: 18),),
                      CText(text: "Active",textHelper: CTextHelper(family: "Poppins Light",fontsize: 13),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 18,),
              Center(
                child: CButton(
                  onClick: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Login()), (route) => false),
                  color: colors['primary'],
                  padding: 20,
                    radius: 30,
                    width: 380,
                    widget: Center(child: CText(text: "Logout",textHelper: CTextHelper(color: Colors.white,family: "Poppins Bold"),),)),
              ),
              SizedBox(height: 23,),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 15),
                child: CText(text: "Latest Complain Information",textHelper: CTextHelper(fontsize: 18,family: "Poppins Bold")),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CText(text: "Here is Information about the latest complain you've already sent",textHelper: CTextHelper(fontsize: 14,family: "Poppins SemiBold")),
              ),
              Divider(indent: 10,),

              //latest complain zone
              isLoading ? Center(child: CircularProgressIndicator(),)
              :
             latestComplain!=null?
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

               latestComplain==null? SizedBox.shrink():_displaySubjects(context,latestComplain!.subjects),
               Padding(
                 padding: const EdgeInsets.only(left: 10,top: 15),
                 child: CText(text: "Status",textHelper: CTextHelper(fontsize: 21,family: "Poppins Bold")),
               ),
                 latestComplain==null? SizedBox.shrink(): Padding(
                 padding: const EdgeInsets.only(left: 10,top: 8),
                 child: Chip(
                     elevation: 7,
                     shadowColor: Colors.white,
                     backgroundColor: Colors.white,
                     label: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(
                           width: 20,
                           height: 20,
                           child: Image.asset("assets/loading.png"),),
                         SizedBox(width: 10,),
                         CText(text: latestComplain!.status.toUpperCase(),textHelper: CTextHelper(fontsize: 17,family: "Poppins SemiBold")),
                       ],
                     )),
               ),
               Divider(indent: 10,),
               Padding(
                 padding: const EdgeInsets.only(left: 10,top: 15),
                 child: CText(text: "Wixii Caqabad Ah Fadlan La Xariir Xafiiska Imtixanadka: 610990099 | 617667766",textHelper: CTextHelper(fontsize: 15,family: "Poppins Light")),
               ),

             ],)
                  : _displayNoDataFoundError(context,"There is no active complaints for this student")
            ],
          ),
        ));
  }

  Widget _displaySubjects(BuildContext context, String subjects) {
    var convertedSubjects=subjects.split(",");
    if(convertedSubjects.length==0)
        return SizedBox.shrink();

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
          children:List.generate(convertedSubjects.length, (index) {
            String subject = convertedSubjects[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Chip(
                elevation: 8,
                label: CText(text: subject),
              ),
            );
          }),


      ),
    );
  }
  
  Widget _displayNoDataFoundError(BuildContext context,String message){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/n.png",width: 160,height: 160,),
          SizedBox(height: 10,),
          CText(text: message,textHelper: CTextHelper(family: "Poppins SemiBold",fontsize: 17),)
        ],
      ),
    );
  }
}
