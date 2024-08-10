import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_list_view/data/api/data_api.dart';
import 'package:practice_list_view/domain/use_case/login_use_case.dart';

class LoginController implements LoginUseCase {
  final DataApi dataApi = DataApi();

  @override
  Future<void> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      debugPrint('Conta criada: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    } catch (e) {
      debugPrint('Erro inesperado: $e');
    }
  }

  @override
  void doLogin(String email, String password) {
    throw UnimplementedError();
  }
}
