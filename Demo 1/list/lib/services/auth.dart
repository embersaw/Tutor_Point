import 'package:firebase_auth/firebase_auth.dart';
import 'package:list/classes/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateInfo('new Tutor');
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
