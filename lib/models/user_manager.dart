import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojavirtual/auth/components/firebase_erros.dart';
import 'package:lojavirtual/models/user.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final loading = false;

  Future<void> signin({
    required Userr user,
    required Function onFail,
    required Function onSuccess,
  }) async {
    setLoading(true);
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

void setLoading(bool value) {
    final loading = value;
    notifyListeners();
  }
}
