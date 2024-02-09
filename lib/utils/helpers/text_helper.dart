import 'dart:ui';

import 'package:flutter/material.dart';

class CTextHelper{
  String family;
   double fontsize;
  FontWeight fontWeight;
  Color color;

  CTextHelper({
   this.fontWeight=FontWeight.normal,
   this.family="Poppins Light",
   this.color=Colors.black,
   this.fontsize=17.0
});
}