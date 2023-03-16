

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keypress_simulator/keypress_simulator.dart';
import 'package:rxdart/rxdart.dart';


double buttonFontSize = 35;
class ButtonController{
  static bool active = false;
  static Function callback = (){};
  static String get text => active ? "||" : "▶";
  static Duration _intervalDuration = Duration(milliseconds: 1000);
  static set intervalDuration(Duration duration) {
    _intervalDuration = duration;
    interval.add(duration.inMilliseconds);
    if(typeTimer!=null){
      typeTimer!.cancel();
      typeTimer = timer;
    }



  }
  static BehaviorSubject<int> interval = BehaviorSubject.seeded(_intervalDuration.inMilliseconds);
  static BehaviorSubject<String> label = BehaviorSubject.seeded("▶");
  static Timer? typeTimer;

  static Timer get timer => Timer.periodic(_intervalDuration, (timer) async {
    await metaV();
    log(_intervalDuration.inMilliseconds.toString() + "ms");
  });
  static Future<void> metaV() async {
    await keyPressSimulator.simulateKeyPress(
      key: LogicalKeyboardKey.keyV,
      modifiers: [ModifierKey.metaModifier],
    );
    await keyPressSimulator.simulateKeyPress(
      key: LogicalKeyboardKey.keyV,
      modifiers: [ModifierKey.metaModifier],
      keyDown: false,
    );

  }
  static Function onPressed = (){
    if (!active) {
      typeTimer= timer;
    } else {
      typeTimer?.cancel();
    }
    active = !active;
    label.add(text);
    callback();
  };

  static TextButton get button {
    return
    TextButton(
      onPressed: () async {
        onPressed();
      },
      child: StreamBuilder<String>(
        stream: label.stream,
        builder: (context, snapshot) {
          return Text(snapshot.data ?? "▶", style: TextStyle(fontSize: buttonFontSize.toDouble()));
        },
      )
    );
  }





}