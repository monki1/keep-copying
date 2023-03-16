
import 'dart:ui';
import 'package:flutter/material.dart';

String shortcutInstruction = "press shift+S to stop, shift+A to start\n(when application is in focus)";
String changeSpeedInstruction = "to change the speed to NUMBER ms/copy\ntype \\NUMBER then press ENTER";
String version = "version: 1.0.0+4";
TextStyle smallLabelStyle = TextStyle(fontSize: 8);


Text smallLabelText(String text){
  return Text(text, textAlign: TextAlign.center ,style: smallLabelStyle);
}

Widget buttonPositioner(Widget child){
  return Container(child:
      child,
    padding: EdgeInsets.only(top: 20),);
}
Widget buttonContainer(Widget child){
  return Container(child:
      child,
      padding: EdgeInsets.only(bottom: 5),
  decoration: BoxDecoration(
  border: Border.all(color: Colors.white12, width: 2),
  borderRadius: BorderRadius.circular(0),
  ));
}
Widget speedStreamLabel(Stream<int> stream){
  return StreamBuilder<int>(
    stream: stream,
    builder: (context, snapshot) {
      return smallLabelText("speed: "+snapshot.data.toString() + "ms/copy");
    },
  );

}