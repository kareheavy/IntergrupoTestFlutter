import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'platform_widget.dart';

class PlatformSwitch extends PlatformWidget<Widget, Widget> {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  PlatformSwitch({
    @required this.text,
    @required this.value,
    @required this.onChanged,
  });

  @override
  Widget createAndroidWidget(BuildContext context) {
    return SwitchListTile(
      title: Text(text),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
