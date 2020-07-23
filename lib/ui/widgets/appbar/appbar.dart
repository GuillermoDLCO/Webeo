import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webeoapp/res/theme.dart' as Theme;

class Appbar {
  getAppBar(BuildContext context, List<Widget>actions) {
    return AppBar(
      brightness: Brightness.light,
      centerTitle: true,
      title: new Padding(
        padding: EdgeInsets.only(top: 4),
        child:
            Image.asset('assets/images/logo_header.png', width: 95, height: 22),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.Colors.primaryColor),
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back_ios, color: Theme.Colors.primaryColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: actions ?? null,
    );
  }
}
