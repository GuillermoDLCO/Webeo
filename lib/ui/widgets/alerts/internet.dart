import 'package:flutter/material.dart';
import 'package:webeoapp/lang/localizations.dart';
import 'package:webeoapp/res/theme.dart' as Theme;

class CustomAlert {
  final BuildContext context;
  final VoidCallback action;
  CustomAlert({this.context, this.action});
  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Icon(Icons.signal_wifi_off, color: Colors.grey[400]),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          'Sin internet',
                          textAlign: TextAlign.center)),
                  InkWell(
                    child: new GestureDetector(
                        onTap: action,
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0)),
                          ),
                          child: Text(
                            AppLocalizations.of(context).accept,
                            style: TextStyle(color: Theme.Colors.primaryColor),
                            textAlign: TextAlign.center,
                          )
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
