import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'button.dart';

final shortcutBindings = {
const SingleActivator(LogicalKeyboardKey.keyS,shift: true): () async {
if ( ButtonController.active){
ButtonController.onPressed();
log("hotkey pressed");
}
},
const SingleActivator(LogicalKeyboardKey.keyA,shift: true): () async {
if ( !ButtonController.active){
ButtonController.onPressed();
log("hotkey pressed");
}
},
};
StatelessWidget callbackWidgetWrapper(Widget child, Map<ShortcutActivator, void Function()> bindings) {
return CallbackShortcuts(bindings: bindings, child: Focus(
  autofocus: true,
  child: child,
),);
}