import 'package:flutter/services.dart';
import 'package:keypress_simulator/keypress_simulator.dart';


Future<void> metaV() async {
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