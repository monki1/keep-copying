import 'package:shared_preferences/shared_preferences.dart';

int initialSpeed = 1000;

int getSavedSpeed(SharedPreferences prefs) {

  int ms = initialSpeed;
  if (prefs.containsKey("interval")) {
    ms = prefs.getInt("interval")!;
  } else {
    prefs.setInt("interval", ms);
  }
  return ms;
}