import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/services.dart';
const minSize = Size(230, 230);
const maxSize = Size(300, 300);

Future<void> setWindowSize() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMinWindowSize(minSize);
    await DesktopWindow.setMaxWindowSize(maxSize);
    await DesktopWindow.setWindowSize(minSize);
  }
}