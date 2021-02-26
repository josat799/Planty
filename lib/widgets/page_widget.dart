import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  Widget child;

  PageWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: this.child,
    );
  }
}
