import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:queen/queen.dart';

import 'app/routes/app_pages.dart';
import 'config/initial_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await InitialBidnings.boot();

  runApp(
    QueenBuilder(
      builder: (context) {
        return GetMaterialApp(
          /// launcher app name
          title: "FLUTTER ",

          /// * theme part 🎨
          theme: AppTheme.current,

          /// * localization part 🌍
          supportedLocales: Lang.supportedLocales,
          locale: Lang.current,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          /// * navigators
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          debugShowCheckedModeBanner: false,
          builder: (_, child) {
            return Directionality(
              textDirection: App.locale.direction,
              child: child!,
            );
          },
        );
      },
    ),
  );
}
