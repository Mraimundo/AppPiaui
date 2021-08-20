import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _clientIdWeb =
      '207836721159-pthukst2nrldlm1t8dvhgk345d6g385s.apps.googleusercontent.com';
  static final _googleSignIn = GoogleSignIn(clientId: _clientIdWeb);
  static Future<GoogleSignInAccount> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}
