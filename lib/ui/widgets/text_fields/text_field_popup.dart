import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef TextCallback = Function(String text);

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key key,
    @required this.controller,
    @required this.name,
    this.focus,
    this.nextFocus,
    this.keyboardType = TextInputType.text,
    @required this.icon,
    this.onChanged,
    this.isPassword = false,
  })  : assert(controller != null),
        assert(name != null),
        assert(icon != null),
        super(key: key);

  final TextEditingController controller;
  final String name;
  final FocusNode focus;
  final FocusNode nextFocus;
  final Widget icon;
  final TextInputType keyboardType;
  final TextCallback onChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 10.0),
          child: Text(
            '$name',
            style: GoogleFonts.allerta(
                textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            )),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(35.0))),
          child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                controller: this.controller,
                focusNode: this.focus,
                textCapitalization: TextCapitalization.words,
                textInputAction: nextFocus != null ? TextInputAction.next : TextInputAction.done,
                keyboardType: this.keyboardType,
                obscureText: this.isPassword,
                onChanged: this.onChanged,
                onFieldSubmitted: (v) {
                  if (nextFocus != null)
                    FocusScope.of(context).requestFocus(nextFocus);
                  else
                    FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 1.2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) return '';
                  return null;
                },
              )),
        ),
      ],
    );
  }
}
