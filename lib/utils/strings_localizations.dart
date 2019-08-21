import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/constants.dart';

class StringLocalizationsDelegate extends LocalizationsDelegate<StringLocalizations> {
  const StringLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['es'].contains(locale.languageCode);

  @override
  Future<StringLocalizations> load(Locale locale) {
    return SynchronousFuture<StringLocalizations>(StringLocalizations(locale));
  }

  @override
  bool shouldReload(StringLocalizationsDelegate old) => false;
}

class StringLocalizations {
  final Locale locale;

  StringLocalizations(this.locale);

  static StringLocalizations of(BuildContext context) {
    return Localizations.of<StringLocalizations>(context, StringLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'es': {
      'titleSignIn': 'Sign In',
      'email': 'Correo Electroníco',
      'emailExample': 'ejemplo@dominio.com',
      ErrorsConstants.emptyEmail: 'Debes ingresar tu correo electrónico',
      'password': 'Contraseña',
      'passwordEnter': 'Digita tu contraseña',
      ErrorsConstants.emptyPassword: 'Debes ingresar tu contraseña',
      'remenberMe': 'Recordar credenciales',
      'signIn': 'Inicio Sesión',
      'accept': 'Aceptar',
      ErrorsConstants.internetNotAvailable: 'Verifica tu conexión a internet e intenta nuevamente',
    },
  };

  String getLocalizedValue(String key) {
    if (key != null && _localizedValues[locale.languageCode].containsKey(key)) {
      return _localizedValues[locale.languageCode][key];
    }
    return key;
  }


  String get titleSignIn => getLocalizedValue('titleSignIn');
  String get email => getLocalizedValue('email');
  String get emailExample => getLocalizedValue('emailExample');
  String get password => getLocalizedValue('password');
  String get passwordEnter => getLocalizedValue('passwordEnter');
  String get remenberMe => getLocalizedValue('remenberMe');
  String get signIn => getLocalizedValue('signIn');
  String get accept => getLocalizedValue('accept');
}
