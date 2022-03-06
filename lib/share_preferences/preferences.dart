import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //* se pretende que todo los metodos, propiedades, getter, setter
  //* todo sea static; eso me permite que sea como un Singleton, muy
  //* facil de elaborar

  //creo peferencias, la instancio
  static late SharedPreferences _prefs;
  //creo la propiedades que quiero que sean globales
  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
