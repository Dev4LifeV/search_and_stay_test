import 'package:search_and_stay_test/core/config/firebase/auth/auth.dart';
import 'package:search_and_stay_test/core/interface/usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsecaseAuth with Usecase<Future<User?>> {
  @override
  Future<User?> call([dynamic args]) {
    try {
      return Authentication.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }
}
