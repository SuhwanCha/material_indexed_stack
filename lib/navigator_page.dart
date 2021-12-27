import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({
    required this.child,
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final GlobalKey navigatorKey;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => widget.child,
      ),
    );
  }
}
