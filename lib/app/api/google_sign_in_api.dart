import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _clientIdWeb =
      '465112897764-vfb1g0q93c2abjejnii410gfvjtibq1l.apps.googleusercontent.com';
  static final _googleSignIn = GoogleSignIn(clientId: _clientIdWeb);
  static Future<GoogleSignInAccount> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}
