import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:online_exam_conmplaining_app/local/local_storage.dart';
import 'package:online_exam_conmplaining_app/models/terms.dart';
import 'package:online_exam_conmplaining_app/pages/comaplain.dart';
import 'package:online_exam_conmplaining_app/pages/login.dart';
import 'package:online_exam_conmplaining_app/providers/terms_provider.dart';
import 'package:online_exam_conmplaining_app/utils/button.dart';
import 'package:online_exam_conmplaining_app/utils/helpers/text_helper.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';
import 'package:provider/provider.dart';

class ActiveComplaints extends StatefulWidget {
  const ActiveComplaints({super.key});

  @override
  State<ActiveComplaints> createState() => _ActiveComplaintsState();
}

class _ActiveComplaintsState extends State<ActiveComplaints> {
  var activeUser ='';
   var image='';
   Terms? terms;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TermsProvider>(context,listen: false).fetchActiveComplainTerms().then((value){
      setState(() {
        terms=value;
      });
    });
    LocalStorage().getLocalDataValue("username").then((value) {

      setState(() {
        activeUser=value;
      });
    });
    LocalStorage().getLocalDataValue("image").then((value) {
      setState(() {
        image=value;
      });

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5,right: 10),
              child: ListTile(
                leading: image=="" ? 
                ClipRRect(borderRadius: BorderRadius.circular(20),child: CircleAvatar(radius: 20,child: Image.asset("assets/logo.png", fit: BoxFit.cover,))) :
                ClipRRect(borderRadius: BorderRadius.circular(20),child: CircleAvatar(radius: 20,child: Image.network("http://192.168.1.16/exam-complaining-app/uploads/$image", fit: BoxFit.cover,))),
                title: CText(text: activeUser,textHelper: CTextHelper(fontsize: 15,fontWeight: FontWeight.bold,family: "Poppins Bold"),),
                subtitle: CText(text: "Student"),
                trailing: InkWell(onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Login())),child: FaIcon(FontAwesomeIcons.angleRight)),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                // decoration: BoxDecoration(
                //   boxShadow: [
                //
                //     BoxShadow(
                //       color: Color(0xFFbec1e5).withOpacity(1),
                //       offset: Offset(4, -4),
                //       blurRadius: 29,
                //       spreadRadius: -8,
                //     ),
                //
                //   ],
                //   borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                //   color: Colors.white
                // ),
                child: Column(
                  children: [
                    SizedBox(height: 18,),
                    Container( width: 300 , height: 300, child: Image.asset("assets/banner.png"),),
                    SizedBox(height: 10,),
                    CText(text: "Active Complaints",textHelper: CTextHelper(fontsize: 17,family: "Poppins Bold"),),
                    CText(text: "Here is Active Exam Complaints",textHelper: CTextHelper(fontsize: 10,family: "Poppins Light")),
                    SizedBox(height: 10,),
                    Chip(label: CText(text: "Cabashada  Imtixaanka ${terms?.examType}-ka")),
                    Chip(label: CText(text: "InActive Date: ${terms==null ? "Fetching..": DateFormat('yyyy-MM-dd').format(terms!.expireDate)}")),
                    SizedBox(height: 10,),
                    CButton(
                      onClick: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>ComplainPage(terms: terms,))),
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
