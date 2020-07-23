import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key key, this.action}) : super(key: key);

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkResponse(
        onTap: action ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              border: Border.all(color: Colors.black, width: 0.1),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  color: Colors.black26,
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Container(width: 50.0),
          ),
        ),
      ),
    );
  }
}
