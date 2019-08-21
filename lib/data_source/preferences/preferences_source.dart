import 'package:flutter_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesSources{

  static PreferencesSources _singleton;
  SharedPreferences _prefs;

  factory PreferencesSources() {
    if (_singleton == null) {
      _singleton = PreferencesSources._();
    }

    return _singleton;
  }

  PreferencesSources._();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get remenberMe => _prefs.getBool(PreferencesConstants.remenberMe) ?? false;

  set remenberMe(bool value) => _prefs.setBool(PreferencesConstants.remenberMe, value);

  get token => _prefs.getString(PreferencesConstants.token) ?? "";

  set token(String value) => _prefs.setString(PreferencesConstants.token, value);

  get email => _prefs.getString(PreferencesConstants.email) ?? "";

  set email(String value) => _prefs.setString(PreferencesConstants.email, value);

  get password => _prefs.getString(PreferencesConstants.password) ?? "";

  set password(String value) => _prefs.setString(PreferencesConstants.password, value);

}