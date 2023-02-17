import 'package:car_parts_app/constants.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool hidePassword;
  CustomInput({this.hidePassword, this.hintText,this.onChanged,this.onSubmitted,this.focusNode,this.textInputAction});



  @override
  Widget build(BuildContext context) {
    bool _hidePassword = hidePassword ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        obscureText: _hidePassword,
        focusNode: focusNode,
        onChanged:onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ??  'HintText..',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            )
        ),
        style: Constants.regularDarkStyle,
      ),
    );
  }
}
