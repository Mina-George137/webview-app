import 'package:flutter/material.dart';

class UrlNotFoundWidget extends StatelessWidget {
  const UrlNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
           'assets/images/img.png',
           width: 200,
           height: 200,
         ),
    );
  }
}
