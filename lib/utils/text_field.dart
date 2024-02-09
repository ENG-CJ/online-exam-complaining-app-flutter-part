import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.fielTitleTxt,
    this.onTextChange,
    this.isHidden=false,
    this.suffixIcon,
    this.inputType=TextInputType.text,
    this.value
  });
  final void Function(String value)? onTextChange;
  final bool isHidden;
  final String? value;
  final String hintText;
  final String fielTitleTxt;
  final Widget? suffixIcon;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            fielTitleTxt,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
            // color: Colors.green[100],
              borderRadius: BorderRadius.circular(10)),
          // color: colors['secondary'],
          height: 60,
          width: MediaQuery.of(context).size.width * 0.95,
          child: TextFormField(
            initialValue: value,
            keyboardType: inputType,
            onChanged: onTextChange,
            obscureText: isHidden,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colors['primary']!.withOpacity(0.2) as Color, width: 2)
              ),

              filled: true,
              fillColor: colors['primary']!.withOpacity(0.1),
              focusedBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colors['primary'] as Color, width: 2)
              ),
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffixIcon,
              // contentPadding: EdgeInsets.only(left: 10.0, top: 16.0),
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
