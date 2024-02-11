import 'package:alert_dialog/alert_dialog.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';

import '../const/colors.dart';

class Profile extends StatefulWidget {
  final void Function()? onLoad;
  const Profile({super.key, this.onLoad});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  var name = '';
  var password = '';
  bool hasError = false;
  bool currentUserHasData = false;

  bool isLoading = true;
  bool changingPassword = false;
  bool hidden = true;
  var error='';
  var dio = Dio();
  int id = 0;
  // Future<void> fetchCurrentUser() async {
  //   try {
  //     Response response = await dio.get("$URL/customers/$id");
  //
  //     if (response.data['status']) {
  //       if (response.data['data'].length > 0) {
  //         currentUserHasData = true;
  //         var data = response.data['data'][0];
  //
  //         user = User(
  //             username: data['fullName'],
  //             email: data['email'],
  //             password: data['password'],
  //             mobile: data['mobile'],
  //             address: data['address'],
  //             user_id: data['cust_id'],
  //             account_status: data['account_status']);
  //       } else
  //         currentUserHasData = true;
  //       hasError = false;
  //     } else {
  //       hasError = true;
  //     }
  //
  //     isLoading = false;
  //     setState(() {});
  //   } catch (e) {
  //     print(" error $e ");
  //     isLoading = false;
  //     setState(() {});
  //   }
  // }

  // Future<void> updatePassword() async {
  //   setState(() {
  //     changingPassword=true;
  //   });
  //   try {
  //     Response response = await dio.post("$URL/customers/updatePass",data: {"pass": password, "id": id});
  //
  //     if (response.data['status']) {
  //       changingPassword=false;
  //       hasError = false;
  //     } else {
  //       changingPassword=false;
  //       hasError = true;
  //       error=response.data['description'];
  //     }
  //
  //     changingPassword=true;
  //     setState(() {});
  //   } catch (e) {
  //     print(" error $e ");
  //     hasError=true;
  //     error=e.toString();
  //     changingPassword=true;
  //     setState(() {});
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LocalStorage().getCurrentUser().then((value) {
    //   print("value $value");
    //   setState(() {
    //     name = value.toString();
    //   });
    // });
    // LocalStorage().getPassword().then((value) {
    //   setState(() {
    //     password = value.toString();
    //   });
    // });
    // LocalStorage().getId().then((value) {
    //   if (value != null) {
    //     id = value;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                      onTap: () {
                        if (widget.onLoad != null) widget.onLoad!();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 100,
                  ),
                  CText(
                    text: "Profile",
                    // textStyle: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 28,
                    //     fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 61.0,
                    backgroundImage: AssetImage('asset/avatar.png'),
                    backgroundColor: colors['primary']!.withOpacity(0.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 87, top: 83),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              // 0xd8c8c8
                              color:
                              Color.fromARGB(0, 0, 0, 0).withOpacity(0.5),
                              offset: Offset(-3, 7),
                              blurRadius: 48,
                              spreadRadius: -3,
                            )
                          ]),
                      child: InkWell(
                          onTap: () {
                            // fetchCurrentUser().then((value) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (_) => EdditPage(
                            //             user: user!,
                            //             onLoad: () {
                            //               LocalStorage()
                            //                   .getCurrentUser()
                            //                   .then((value) {
                            //                 setState(() {
                            //                   if (value != null)
                            //                     name = value;
                            //                 });
                            //               });
                            //             },
                            //           )));
                            // });
                          },
                          child: Icon(Icons.edit)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CText(
                  text: name.split(" ")[0],
                 ),
              SizedBox(
                height: 13,
              ),
              // Container(
              //   height: 400,
              //
              //   ///440
              //   width: 349,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(34),
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Color(0xd8c8c8).withOpacity(1),
              //           offset: Offset(1, 1),
              //           blurRadius: 11,
              //           spreadRadius: 1,
              //         )
              //       ]),
              //
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 2, right: 10),
              //           child: InkWell(
              //             onTap: (){
              //               Navigator.push(context, MaterialPageRoute(builder: (_)=>YourOrders()));
              //             },
              //             child: CustomListTile(
              //                 leading: FontAwesomeIcons.cartShopping,
              //                 title: "Orders",
              //                 trailing: Icons.arrow_forward_ios),
              //           ),
              //         ),
              //         Divider(
              //           thickness: 2,
              //           height: 10,
              //           indent: 15,
              //           endIndent: 20,
              //         ),
              //         SizedBox(
              //           height: 0,
              //         ),
              //         InkWell(
              //           onTap: () {
              //             LocalStorage().getPassword().then((value) {
              //               setState(() {
              //                 password=value.toString();
              //               });
              //             });
              //             showDialog(
              //                 context: context,
              //                 builder: (_) => AlertDialog(
              //                   content: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     crossAxisAlignment:
              //                     CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                           "The confidentiality of your password is crucial; kindly ensure its secrecy and avoid sharing it."),
              //                       SizedBox(
              //                         height: 14,
              //                       ),
              //                       TextFormField(
              //                         obscureText: true,
              //                         onChanged: (value) {
              //                           setState(() {
              //                             password = value;
              //                           });
              //                         },
              //                         initialValue: password,
              //                         style: TextStyle(
              //                             fontFamily: "Poppins Bold",
              //                             color: colors['primary']),
              //                         // readOnly: true,
              //                         decoration: InputDecoration(
              //                             helperText:
              //                             "For Security Purpose, You Can't"
              //                                 "\nView The Password!",
              //                             enabledBorder: OutlineInputBorder(
              //                                 borderRadius:
              //                                 BorderRadius.circular(15),
              //                                 borderSide: BorderSide(
              //                                     color: colors['primary']
              //                                     as Color)),
              //                             focusedBorder: OutlineInputBorder(
              //                                 borderRadius:
              //                                 BorderRadius.circular(15),
              //                                 borderSide: BorderSide(
              //                                     color: colors['primary']
              //                                     as Color))),
              //                       ),
              //                       SizedBox(
              //                         height: 14,
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: CButton(
              //                           onClick: () {
              //                             if (password == "") {
              //                               showDialog(
              //                                   context: context,
              //                                   builder: (_) => AlertDialog(
              //                                     title: Text("Error"),
              //                                     content: Column(
              //                                       mainAxisSize:
              //                                       MainAxisSize
              //                                           .min,
              //                                       children: [
              //                                         Text(
              //                                           "You Can't Update Your Password with empty Data!",
              //                                           style:
              //                                           TextStyle(
              //                                             color: Colors
              //                                                 .redAccent,
              //                                             fontFamily:
              //                                             "Poppins Medium",
              //                                           ),
              //                                         ),
              //                                         SizedBox(height: 16,),
              //                                         CButton(
              //                                             onClick: ()=>Navigator.pop(context),
              //                                             widget:
              //                                             Center(
              //                                               child: Text(
              //                                                 "Return",
              //                                                 style:
              //                                                 TextStyle(
              //                                                   color: Colors.white,
              //                                                   fontFamily:
              //                                                   "Poppins Bold",
              //                                                 ),
              //                                               ),
              //                                             ))
              //                                       ],
              //                                     ),
              //                                   ));
              //                               return;
              //                             }
              //                             if(!Validator().passLength(password)){
              //                               showDialog(
              //                                   context: context,
              //                                   builder: (_) => AlertDialog(
              //                                     title: Text("Error"),
              //                                     content: Column(
              //                                       mainAxisSize:
              //                                       MainAxisSize
              //                                           .min,
              //                                       children: [
              //                                         Text(
              //                                           "Password Must Be greater than 4 Characters",
              //                                           style:
              //                                           TextStyle(
              //                                             color: Colors
              //                                                 .redAccent,
              //                                             fontFamily:
              //                                             "Poppins Medium",
              //                                           ),
              //                                         ),
              //                                         SizedBox(height: 16,),
              //                                         CButton(
              //                                             onClick: ()=>Navigator.pop(context),
              //                                             widget:
              //                                             Center(
              //                                               child: Text(
              //                                                 "Return",
              //                                                 style:
              //                                                 TextStyle(
              //                                                   color: Colors.white,
              //                                                   fontFamily:
              //                                                   "Poppins Bold",
              //                                                 ),
              //                                               ),
              //                                             ))
              //                                       ],
              //                                     ),
              //                                   ));
              //                               return;
              //                             }
              //
              //                             updatePassword().then((value) {
              //                               if(hasError){
              //                                 showDialog(
              //                                     context: context,
              //                                     builder: (_) => AlertDialog(
              //                                       title: Text("Error"),
              //                                       content: Column(
              //                                         mainAxisSize:
              //                                         MainAxisSize
              //                                             .min,
              //                                         children: [
              //                                           Text(
              //                                             error,
              //                                             style:
              //                                             TextStyle(
              //                                               color: Colors
              //                                                   .redAccent,
              //                                               fontFamily:
              //                                               "Poppins Medium",
              //                                             ),
              //                                           ),
              //                                           SizedBox(height: 16,),
              //                                           CButton(
              //                                               onClick: ()=>Navigator.pop(context),
              //                                               widget:
              //                                               Center(
              //                                                 child: Text(
              //                                                   "Return",
              //                                                   style:
              //                                                   TextStyle(
              //                                                     color: Colors.white,
              //                                                     fontFamily:
              //                                                     "Poppins Bold",
              //                                                   ),
              //                                                 ),
              //                                               ))
              //                                         ],
              //                                       ),
              //                                     ));
              //                                 return;
              //                               }
              //                               Navigator.pop(context);
              //                               showDialog(
              //                                   context: context,
              //                                   builder: (_) => AlertDialog(
              //                                     title: Text("Privacy Updated"),
              //                                     content: Column(
              //                                       mainAxisSize:
              //                                       MainAxisSize
              //                                           .min,
              //                                       children: [
              //                                         Text(
              //                                           "Your Security Code Has been updated!",
              //                                           style:
              //                                           TextStyle(
              //                                             fontFamily:
              //                                             "Poppins Medium",
              //                                           ),
              //                                         ),
              //                                         SizedBox(height: 16,),
              //                                         CButton(
              //                                             onClick: ()=>Navigator.pop(context),
              //                                             widget:
              //                                             Center(
              //                                               child: Text(
              //                                                 "Return",
              //                                                 style:
              //                                                 TextStyle(
              //                                                   color: Colors.white,
              //                                                   fontFamily:
              //                                                   "Poppins Bold",
              //                                                 ),
              //                                               ),
              //                                             ))
              //                                       ],
              //                                     ),
              //                                   ));
              //                             }).then((value) {
              //                               LocalStorage().updatePassKey(password);
              //                             });
              //                           },
              //                           widget: Center(
              //                               child: Row(
              //                                 mainAxisAlignment:
              //                                 MainAxisAlignment.center,
              //                                 children: [
              //                                   FaIcon(FontAwesomeIcons
              //                                       .penToSquare),
              //                                   SizedBox(
              //                                     width: 10,
              //                                   ),
              //                                   Text(
              //                                     "Change",
              //                                     style: TextStyle(
              //                                         fontSize: 17,
              //                                         fontFamily:
              //                                         "Poppins Bold"),
              //                                   ),
              //                                 ],
              //                               )),
              //                           width: double.maxFinite,
              //                           radius: 16,
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ));
              //             // alert(context,
              //             //     title: Text("Privacy"),
              //             //     textOK: SizedBox.shrink(),
              //             //     content: );
              //           },
              //           child: CustomListTile(
              //               leading: Icons.password,
              //               title: "Security",
              //               trailing: Icons.arrow_forward_ios),
              //         ),
              //         Divider(
              //           thickness: 2,
              //           height: 10,
              //           indent: 15,
              //           endIndent: 20,
              //         ),
              //         InkWell(
              //           onTap: () {
              //             CoolAlert.show(
              //                 context: context,
              //                 type: CoolAlertType.confirm,
              //                 title: "Confirm To Exit?",
              //                 confirmBtnText: "Exit",
              //                 cancelBtnText: "Return",
              //                 onConfirmBtnTap: () {
              //                   LocalStorage().clearLocalData().then((value) {
              //                     Navigator.pushAndRemoveUntil(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (_) => LoginPage()),
              //                             (route) => false);
              //                   });
              //                 });
              //           },
              //           child: CustomListTile(
              //             leading: Icons.logout,
              //             title: "Logout",
              //           ),
              //         ),
              //         Divider(
              //           thickness: 2,
              //           height: 10,
              //           indent: 15,
              //           endIndent: 20,
              //         ),
              //         SizedBox(
              //           height: 30,
              //         ),
              //         cText(text: "Hilaal@cook.com")
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
