import 'package:flutter/material.dart';

class ActionButtonCustom extends StatelessWidget {
  final VoidCallback action;
  final String label;

  ActionButtonCustom({Key key, @required this.action, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: new RaisedButton(
        onPressed: this.action,
        color: Colors.transparent,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF2DC897),
                Color(0xFF7EF192),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
            alignment: Alignment.center,
            child: Text(this.label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
