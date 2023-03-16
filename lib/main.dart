import 'package:flutter/material.dart';
import 'package:keep_copying/persistence.dart';
import 'package:keep_copying/set_speed.dart';
import 'package:keep_copying/set_window_size.dart';
import 'package:keep_copying/shortcut.dart';
import 'package:keep_copying/ui_components.dart';
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
      TextField(
          controller: tec,
          focusNode: focusNode,
          onSubmitted: (value) async {
            setSpeed(value, (int ms){
            ButtonController.intervalDuration = Duration(milliseconds: ms);
                prefs.setInt("interval", ms);});
            tec.clear();
            focusNode.requestFocus();
          }),

      speedStreamLabel(ButtonController.interval),
      smallLabelText("$shortcutInstruction\n$changeSpeedInstruction\n$version")
    ],),


  )

  );

  runApp(QuickApp(page:
  callbackWidgetWrapper(page, shortcutBindings)

  ));
}



