import 'package:bu_admin_panal/config/lang.dart';
import 'package:dio/dio.dart';
import 'package:bu_admin_panal/config/endpoints.dart';
import 'package:bu_admin_panal/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:queen/queen.dart';

abstract class InitialBidnings {
  static Future<void> boot() async {
    // ensure the app is alwats connected to the native os
    WidgetsFlutterBinding.ensureInitialized();
    await App.boot(
      themeConfig: AppThemeConfig(),
      nationsConfig: AppLangConfig(),
    );

    /// ?  inject permenant depndencies
    final dio = Dio(
      BaseOptions(
        baseUrl: EndpointsV1.v1,
        validateStatus: (_) => true,
        headers: {
          'accept': 'application/json',
        },
      ),
    );

    /// list of used dio interceptors
    final interceptors = <Interceptor>[
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   error: true,
      //   compact: true,
      //   maxWidth: 90,
      // ),
    ];
    dio.interceptors.addAll(interceptors);
    // final api = ApiClient(dio);

    /// inject services
    // Get.put(AuthService(v1: api), permanent4: true);
  }
}
