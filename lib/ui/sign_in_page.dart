import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/provider/provider.dart';
import 'package:flutter_app/blocs/sign_in_bloc.dart';
import 'package:flutter_app/data_source/preferences/preferences_source.dart';
import 'package:flutter_app/ui/platforms_widget/platform_alert.dart';

import 'package:flutter_app/ui/platforms_widget/platform_app_bar.dart';
import 'package:flutter_app/ui/platforms_widget/platform_button.dart';
import 'package:flutter_app/ui/platforms_widget/platform_switch.dart';
import 'package:flutter_app/ui/platforms_widget/platform_text_field.dart';
import 'package:flutter_app/utils/strings_localizations.dart';
import 'package:models/sign_in_request.dart';
import 'package:models/custom_exception.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _passwordNode = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignInBloc _bloc;
  StringLocalizations _stringLocalization;
  PreferencesSources _prefs;
  bool _switchValue;

  @override
  void initState() {
    super.initState();
    _bloc = $Provider.of<SignInBloc>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _stringLocalization = StringLocalizations.of(context);
    _prefs = PreferencesSources();
    _switchValue = _prefs.remenberMe;
    if (_prefs.remenberMe) {
      _emailController = TextEditingController(text: _prefs.email);
      _passwordController = TextEditingController(text: _prefs.password);
    }
  }

  @override
  void dispose() {
    $Provider.dispose<SignInBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(
        title: Text(_stringLocalization.titleSignIn),
      ),
      body: StreamBuilder<bool>(
          stream: _bloc.isLoading,
          builder: (context, snapshotIsLoading) {
            return IgnorePointer(
              ignoring: snapshotIsLoading.data == null
                  ? false
                  : snapshotIsLoading.data,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _emailTextField(context),
                    SizedBox(
                      height: 10.0,
                    ),
                    _passwordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _remenberMeSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _signInButton(snapshotIsLoading),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return StreamBuilder<String>(
        stream: _bloc.email,
        builder: (context, snapshotEmail) {
          return PlatformTextField(
            labelText: _stringLocalization.email,
            hintText: _stringLocalization.emailExample,
            errorText:
                _stringLocalization.getLocalizedValue(snapshotEmail.data),
            controller: _emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (text) {
              _passwordNode.nextFocus();
            },
          );
        });
  }

  Widget _passwordTextField() {
    return StreamBuilder<String>(
        stream: _bloc.password,
        builder: (context, snapshotPassword) {
          return PlatformTextField(
            labelText: _stringLocalization.password,
            hintText: _stringLocalization.passwordEnter,
            errorText:
                _stringLocalization.getLocalizedValue(snapshotPassword.data),
            controller: _passwordController,
            obscureText: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            focusNode: _passwordNode,
          );
        });
  }

  Widget _remenberMeSwitch() {
    return StreamBuilder<bool>(
        stream: _bloc.remenberMe,
        builder: (context, snapshotRemenberMe) {
          return PlatformSwitch(
            text: _stringLocalization.remenberMe,
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _prefs.remenberMe = value;
                _switchValue = value;
              });
            },
          );
        });
  }

  Widget _signInButton(AsyncSnapshot<bool> snapshotIsLoading) {
    return PlatformButton(
      text: _stringLocalization.signIn,
      isLoading:
          snapshotIsLoading.data == null ? false : snapshotIsLoading.data,
      onPressed: () {
        _signIn();
      },
    );
  }

  void _signIn() {
    if (_bloc.isLoading.value) {
      return;
    }

    var email = _emailController.text.trim();
    var password = _passwordController.text.trim();
    var signInRequest = SignInRequest(email: email, password: password);
    _bloc.signIn(signInRequest).then((result) {
      if (result != null) {
        if(_prefs.remenberMe){
          _prefs.email = email;
          _prefs.password = password;
        }else{
          _prefs.email = "";
          _prefs.password = "";
        }
        _prefs.token = result.authToken;
        _showError("Login");
      }
    }).catchError((error) {
      if (error is CustomException) {
        _showError(error.error);
      }
    });
//    var signInRequest = SignInRequest.params(email, password);
//    _bloc.signIn(signInRequest).then((result) async {
//      if (result.status != Status.error) {
//        await _saveToken(result.data);
//        _getTenants();
//      } else if (result.error != null) {
//        _showError(result.error.message);
//      }
//    });
  }

  void _showError(String message) {
    PlatformAlert.showPlatformDialog(
      context: context,
      content: _stringLocalization.getLocalizedValue(message),
      positiveTextButton: _stringLocalization.accept,
      positiveOnPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
