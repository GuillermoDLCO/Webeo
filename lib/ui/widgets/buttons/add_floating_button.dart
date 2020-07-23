import 'package:flutter/material.dart';
import 'package:webeoapp/res/pallete_color.dart';
import 'dart:math' as math;

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({
    Key key,
    @required this.icons,
    @required AnimationController controller,
    @required this.backgroundColor,
    @required this.foregroundColor,
    @required this.actionFirstButton,
    @required this.actionSecondButton,
  }) : _controller = controller, super(key: key);

  final List<IconData> icons;
  final AnimationController _controller;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback actionFirstButton;
  final VoidCallback actionSecondButton;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: new List.generate(icons.length, (int index) {
          Widget child = Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new ScaleTransition(
                scale: new CurvedAnimation(
                  parent: _controller,
                  curve: new Interval(0.0, 1.0 - index / icons.length / 2.0, curve: Curves.easeOut),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.white, boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                      color: Colors.black.withOpacity(.22),
                      offset: Offset(
                        15.0,
                        15.0,
                      ),
                    )
                  ]),
                  child: Text(index == 1 ? '' : ''),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 70.0,
                width: 56.0,
                alignment: FractionalOffset.topCenter,
                child: new ScaleTransition(
                  scale: new CurvedAnimation(
                    parent: _controller,
                    curve: new Interval(0.0, 1.0 - index / icons.length / 2.0, curve: Curves.easeOut),
                  ),
                  child: new FloatingActionButton(
                    heroTag: null,
                    backgroundColor: backgroundColor,
                    child: new Icon(icons[index], color: foregroundColor),
                    onPressed: index == 1 ? actionFirstButton : actionSecondButton,
                  ),
                ),
              )
            ],
          );

          return child;
        }).toList()
          ..add(new FloatingActionButton(
            heroTag: null,
            backgroundColor: PalleteColor.actionButtonColor,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.75 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(
                    _controller.isDismissed ? Icons.add : Icons.add,
                    size: 30.0,
                  ),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          )));
  }
}
