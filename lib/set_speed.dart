import 'dart:developer';

setSpeed(String value, Function(int) callback) {

  if (value.startsWith("\\")) {
    try {
      int ms = int.parse(value.substring(1));
      callback(ms);
    } catch (e) {
      log(e.toString());
    }
  }
}