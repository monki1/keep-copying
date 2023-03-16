import 'dart:developer';

bool setSpeed(String value, Function(int) callback) {

  if (value.startsWith("\\")) {
    try {
      int ms = int.parse(value.substring(1));
      callback(ms);
      return true;
    } catch (e) {
      log(e.toString());
    }
  }
  return false;
}