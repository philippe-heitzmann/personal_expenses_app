import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdaptiveFlatButton extends StatelessWidget {
  // const AdaptiveFlatButton({Key? key}) : super(key: key);

  final VoidCallback presentDatePicker;
  final String showText;

  AdaptiveFlatButton({required this.presentDatePicker, required this.showText});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: presentDatePicker,
            child: Text(showText,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)))
        : TextButton(
            onPressed: presentDatePicker,
            child: Text(showText,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue)));
  }
}
