import 'package:flutter/material.dart';
import 'package:online_exam_conmplaining_app/utils/text.dart';

import '../const/colors.dart';
import 'helpers/text_helper.dart';

class CButton extends StatelessWidget {
  final Widget widget;
  final void Function()? onClick;
  final Color? color;
  final double? padding, width,radius;
  const CButton({super.key,this.onClick,required this.widget,this.color,this.radius,this.padding,this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width??210,
        padding: EdgeInsets.all(padding??14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius??9),
            color: color??colors['primary']
        ),
        child: widget
      ),
    );
  }
}
