import 'package:coffeecafebrew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffeecafebrew/models/user.dart';

class AuthService {
  AuthService() {
    Firebase.initializeApp();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CusUser _userFromFirebase(User user) {
    return user != null ? CusUser(uid: user.uid) : null;
  }

  Stream<CusUser> get user {
    print(_auth.authStateChanges());
    return _auth.authStateChanges().map(_userFromFirebase);
    // return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData("0", "New Member", 100);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
