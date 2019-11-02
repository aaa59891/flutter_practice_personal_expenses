import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final void Function() onPress;
  final Widget child;
  final Color textColor;
  AdaptiveFlatButton({this.onPress, this.child, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: this.child,
            onPressed: this.onPress,
          )
        : FlatButton(
            textColor: this.textColor ?? Theme.of(context).primaryColor,
            child: this.child,
            onPressed: this.onPress,
          );
  }
}
