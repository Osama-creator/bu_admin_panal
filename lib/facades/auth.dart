abstract class Auth {
  // @protected
  // static AuthService get service => Get.find<AuthService>();

  // /// return loged in use [BeraerToken]
  // static String get bearerToken => 'Bearer ${service.token}';

  // /// * returns the user token
  // /// ? if there is no token will return empty [String]
  // static String get token => service.token;

  // /// * return true if the user is authenticated
  // static bool get isLoggedIn => service.isLoggedIn;

  // /// * return true if the user is NOT  authenticated
  // static bool get isLoggedOut => service.isLoggedOut;

  // /// * reutrn the current auth user
  // /// ! if the user is not authenticated, throws Excpetion
  // static User get user => service.user;

  // /// * signs the user in the api
  // /// ? in case of sucess saves the user token to shared prefs
  // /// ! in case of [LaravelException] throw instance of [LaravelException]
  // static Future<void> signInWithEmailAndPassword(
  //   SignInDto dto,
  // ) =>
  //     service.signInWithEmailAndPassword(dto);

  // /// * return the auth user from the api
  // /// ? cache the last snapShot from the api prefs if [cacheAfter] is true
  // static Future<User> meFromApi() => service.meFromApi();
  // static Future<void> signOut() => service.signOut();
}
