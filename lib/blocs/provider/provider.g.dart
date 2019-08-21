// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// BlocProviderGenerator
// **************************************************************************

class $Provider extends Provider {
  static T of<T extends Bloc>() {
    switch (T) {
      case SignInBloc:
        {
          return BlocCache.getBlocInstance(
              "SignInBloc", () => SignInBloc.instance());
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case SignInBloc:
        {
          BlocCache.dispose("SignInBloc");
          break;
        }
    }
  }
}
