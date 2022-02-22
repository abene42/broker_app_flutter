import 'package:flutter/material.dart';

class MyConstants extends InheritedWidget {
  static MyConstants? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({required Widget child, required Key key})
      : super(key: key, child: child);

  final Color mainColor = const Color(0xff3E4E5E);

  @override
  bool updateShouldNotify(MyConstants oldWidget) => false;
}
