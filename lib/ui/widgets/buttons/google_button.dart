import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key key, this.action}) : super(key: key);

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.transparent,
      type: MaterialType.circle,
      child: InkResponse(
        onTap: action ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SvgPicture.asset('assets/social/google.svg'),
        ),
      ),
    );
  }
}
