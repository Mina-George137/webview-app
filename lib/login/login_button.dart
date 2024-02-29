import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color bkg, textColor;
  final IconData icn;
  final String textStr;
  Future<void> onPressed;
  LoginButton({Key? key, required this.bkg,required this.textColor,required this.icn, required this.textStr
  , required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed,
      icon:Icon(icn,color: Colors.white),
      label: Text(textStr, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        primary: bkg,
        minimumSize: Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
