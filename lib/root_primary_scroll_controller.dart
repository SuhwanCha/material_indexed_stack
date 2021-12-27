import 'package:flutter/material.dart';

import 'navigator_page.dart';

class RootPrimaryScrollController {
  static ScrollController? of(BuildContext context) {
    final ctx =
        context.findAncestorStateOfType<State<NavigatorPage>>()?.context;
    final result =
        ctx?.dependOnInheritedWidgetOfExactType<PrimaryScrollController>();
    return result?.controller;
  }
}
