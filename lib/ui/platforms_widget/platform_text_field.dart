import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'platform_widget.dart';

class PlatformTextField extends PlatformWidget<Widget, Widget> {
  final String labelText;
  final String hintText;
  final String errorText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;

  PlatformTextField({
    this.labelText,
    this.hintText,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 10.0,
          top: 15.0,
          right: 10.0,
          bottom: 15.0,
        ),
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        labelText != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(labelText),
              )
            : Container(),
        CupertinoTextField(
          controller: controller,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          padding: const EdgeInsets.all(10.0),
          placeholder: hintText,
        ),
        _ErrorText(errorText),
      ],
    );
  }
}

class _ErrorText extends StatefulWidget {
  final String error;

  _ErrorText(this.error);

  @override
  __ErrorTextState createState() => __ErrorTextState();
}

class __ErrorTextState extends State<_ErrorText> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 200),
      child: widget.error == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                widget.error,
                style: TextStyle(color: CupertinoColors.destructiveRed),
                maxLines: 3,
              ),
            ),
    );
  }
}
