import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/auth/components/firebase_erros.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signin({required Userr user, required Function onFail}) async {
    try {
      final  result = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print(result.user?.uid);
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
  }
}
