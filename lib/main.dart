import 'package:flutter/material.dart';
import 'package:keep_pasting/keep_pasting.dart';
import 'package:quick_app_generator/quick_app_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'button.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int ms = getSavedSpeed(prefs);
  ButtonController.intervalDuration = Duration(milliseconds: ms);
  setWindowSize();

  FocusNode focusNode = FocusNode();
  TextEditingController tec = TextEditingController();
  ButtonController.callback = () {
    focusNode.requestFocus();
  };
  Widget page = QuickPage(body:
  Center(child:
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buttonPositioner(
        buttonContainer(ButtonController.button)
    ),
        SizedBox(
          height: 35,
          child:
        TextField(
          decoration: inputDecoration,
            controller: tec,
            focusNode: focusNode,
            onSubmitted: (value) async {
              bool speedSet = setSpeed(value, (int ms){
              ButtonController.intervalDuration = Duration(milliseconds: ms);
                  prefs.setInt("interval", ms);});
              if(!speedSet){
                SetStop.parseCurfew(value);
              }

              tec.clear();
              focusNode.requestFocus();
            }),
        ),

        speedStreamLabel(ButtonController.interval),
        sleepStreamLabel(SetStop.curfewStream),
        divider,
        smallLabelText(instructionLabel),
        buyMeACoffeeLink,
        smallLabelText(version),
      ],
    ),
  )

  );

  runApp(QuickApp(page:
  callbackWidgetWrapper(page, shortcutBindings)

  ));
}



