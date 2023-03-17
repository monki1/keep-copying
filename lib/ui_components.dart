import 'package:flutter/material.dart';


String changeSpeedInstruction = "- to change the SPEED to NUMBER ms/paste\ntype \\NUMBER then press ENTER";
String autoStopInstruction = "- to STOP after N minutes\ntype /N then press ENTER";
String shortcutInstruction = "- press shift+S to stop, shift+A to start\n(when application is in focus)";
String version = "version: 1.0.0+4";
String instructionLabel = "$autoStopInstruction\n$changeSpeedInstruction\n$shortcutInstruction\n$version";
TextStyle smallLabelStyle = const TextStyle(fontSize: 8);
TextStyle smallLabelStyleBold = const TextStyle(fontSize: 8, fontWeight: FontWeight.bold);


SelectableText smallLabelText(String text, {bool bold = false}){
  return SelectableText(text, textAlign: TextAlign.center ,style: bold? smallLabelStyleBold :smallLabelStyle);
}

Widget buttonPositioner(Widget child){
  return Container(padding: const EdgeInsets.only(top: 20),child:
      child,);
}
Widget buttonContainer(Widget child){
  return Container(padding: const EdgeInsets.only(bottom: 5),
  decoration: BoxDecoration(
  border: Border.all(color: Colors.white12, width: 2),
  borderRadius: BorderRadius.circular(0),
  ), child:
      child);
}
Widget speedStreamLabel(Stream<int> stream){
  return StreamBuilder<int>(
    stream: stream,
    builder: (context, snapshot) {
      return smallLabelText("SPEED: ${snapshot.data}MS/PASTE", bold: true);
    },
  );

}

Widget sleepStreamLabel(Stream<DateTime?> stream){
  return StreamBuilder<DateTime?>(
    stream: stream,
    builder: (context, snapshot) {
      DateTime? sleepTime = snapshot.data ?? null;
      String sleepTimeString = sleepTime == null ? "N/A" : sleepTime.toIso8601String();
      return smallLabelText("AUTO-STOP: ${sleepTimeString.split(".")[0]}", bold: true);
    },
  );

}

Text divider = Text("".padLeft(80,"-"), style: TextStyle(fontSize: 6));
Color inputFill = Colors.white.withOpacity(0.05);
InputDecoration inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(0),
  fillColor: inputFill,
  filled: true,
);
