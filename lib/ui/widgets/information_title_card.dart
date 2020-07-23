import 'package:flutter/material.dart';
import 'package:webeoapp/res/light_color.dart';
import 'package:webeoapp/res/pallete_color.dart';

class InformationTitleCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget icon;
  final Color iconColor;

  const InformationTitleCard({Key key, @required this.title, @required this.subTitle, @required this.icon, @required this.iconColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 15.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: LightColor.cardBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            new BoxShadow(color: Colors.black12, blurRadius: 4.0, spreadRadius: 2, offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: icon,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(title, softWrap: true, style: TextStyle(color: PalleteColor.titleTextColor, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Text(subTitle, softWrap: true, style: TextStyle(color: PalleteColor.informationText, fontSize: 14))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
