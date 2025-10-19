import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext currentContext()  {
  return navigatorKey.currentContext!;
}


class SvNavigaton {
  void navigateTo({String? pageName, dynamic screen}) {
    if (pageName != null) {
      Navigator.pushNamed(currentContext()!, pageName);
    }
    Navigator.push(currentContext()!, MaterialPageRoute(builder: (_) => screen));
  }
}
