// holds the api endpoints for both apps

abstract class EndpointsV1 {
  /// [api]
  static const String baseUrl = 'https://848b-156-199-51-72.eu.ngrok.io';

  /// [api] [v1]
  static const String v1 = '$baseUrl/api/v1';

  /// [POST]
  /// [StatusCode] [200]
  static const String signIn = '/auth/login';

  /// [POST]
  /// [StatusCode] [200]
  static const String register = '/auth/register';

  static const login = '/auth/sign-in';
  static const signOut = '/auth/sign-out';

  static const forgetPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';
  static const changePassword = '/auth/change-password';

  /// [GET] return the current auth user from the server
  /// [StatusCode] [200]
  /// required a [token]
  static const me = '/auth/me';
}
