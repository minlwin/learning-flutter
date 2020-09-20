import 'package:flutter/material.dart';

class DropdownData extends InheritedWidget {
  final List<String> list;

  DropdownData({Key key, @required this.list, @required Widget child})
      : super(key: key, child: child);

  static DropdownData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DropdownData>();

  @override
  bool updateShouldNotify(DropdownData oldWidget) => list != oldWidget.list;
}
