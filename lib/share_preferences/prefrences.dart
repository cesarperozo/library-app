import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _names = '';
  static String _lastNames = '';
  static String _email = '';
  static String _phone = '';
  static String _gender = '';
  static String _dateOfBirth = '';
  static String _age = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get names {
    return _prefs.getString('names') ?? _names;
  }

  static set names(String names) {
    _names = names;
    _prefs.setString('names', names);
  }

  static String get lastNames {
    return _prefs.getString('lastNames') ?? _lastNames;
  }

  static set lastNames(String lastNames) {
    _lastNames = lastNames;
    _prefs.setString('lastNames', lastNames);
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static set email(String email) {
    _email = email;
    _prefs.setString('email', email);
  }

  static String get phone {
    return _prefs.getString('phone') ?? _phone;
  }

  static set phone(String phone) {
    _phone = phone;
    _prefs.setString('phone', phone);
  }

  static String get gender {
    return _prefs.getString('gender') ?? _gender;
  }

  static set gender(String gender) {
    _gender = gender;
    _prefs.setString('gender', gender);
  }

  static String get dateOfBirth {
    return _prefs.getString('dateOfBirth') ?? _dateOfBirth;
  }

  static set dateOfBirth(String dateOfBirth) {
    _dateOfBirth = dateOfBirth;
    _prefs.setString('dateOfBirth', dateOfBirth);
  }

  static String get age {
    return _prefs.getString('age') ?? _age;
  }

  static set age(String age) {
    _age = age;
    _prefs.setString('age', age);
  }
}
