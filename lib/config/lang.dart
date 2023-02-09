import 'package:flutter/material.dart';
import 'package:queen/config/lang.dart';

class AppLangConfig extends NationsConfig {
  @override
  List<Locale> get supportedLocales => [
        const Locale('ar'),
        const Locale('en'),
      ];

  @override
  String notFound(String key) => 'null';
}
