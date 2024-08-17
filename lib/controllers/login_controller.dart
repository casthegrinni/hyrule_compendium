import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_list_view/data/api/data_api.dart';
import 'package:practice_list_view/domain/models/simple_request_model.dart';
import 'package:practice_list_view/domain/use_case/login_use_case.dart';

class LoginController implements LoginUseCase {
  final DataApi dataApi = DataApi();

  @override
  Future<SimpleRequestModel> createAccount(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      debugPrint(
          'Create account done with success ${userCredential.user?.email}');
      return SimpleRequestModel(success: true);
    } on FirebaseAuthException catch (e) {
      return SimpleRequestModel(success: false, error: e.message);
    } catch (e) {
      return SimpleRequestModel(success: false, error: '$e');
    }
  }

  @override
  Future<SimpleRequestModel> doLogin(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      debugPrint('login done with Success ${userCredential.user?.email}');
      return SimpleRequestModel(success: true);
    } on FirebaseAuthException catch (e) {
      return SimpleRequestModel(success: false, error: e.message);
    } catch (e) {
      return SimpleRequestModel(success: false, error: '$e');
    }
  }
}
