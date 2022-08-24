import 'package:class_app/firebaseRef/references.dart';
import 'package:class_app/screens/login/loginScreen.dart';
import 'package:class_app/widgets/dialogs/simpleDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _firebaseAuth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
    _firebaseAuth = FirebaseAuth.instance;
    _authStateChanges = _firebaseAuth.userChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
  }

  void signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: authAccount.idToken, accessToken: authAccount.accessToken);
        await _firebaseAuth.signInWithCredential(credential);
        await saveUser(account);
        navidgateToHomePage();
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilePic': account.photoUrl,
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  void showLoginDialog() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
      navidgateToLoginPage();
    }), barrierDismissible: false);
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  void navidgateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  Future<void> signOut() async {
    //AppLogger.d('sign out');
    try {
      await _firebaseAuth.signOut();
      navidgateToHomePage();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  User? getUser() {
    _user.value = _firebaseAuth.currentUser;
    return _user.value;
  }

  void navidgateToHomePage() {
    Get.offAllNamed('/home');
  }
}
