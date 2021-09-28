import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  /* static final _clientIdWeb =
      '714023143847-73cdb676b339tspo7076qnjeetq8krst.apps.googleusercontent.com'; */
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}
