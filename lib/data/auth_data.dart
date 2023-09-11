import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/data/firestore.dart';

abstract class AuthenticationDataSource{
  Future<void> register (String email, String password,String passwordConfirm);
  Future<void> login(String email, String password);
}

  class AuthenticationRemote extends AuthenticationDataSource {
    @override
    Future<void> login(String email, String password) async {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    }

    @override
    Future<void> register(String email, String password, String passwordConfirm) async {
      if (password == passwordConfirm) {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim()).then((value) {
              Firestore_Datasource().CreateUser(email); // this line is used to create a new user in the database store
        });
      }
    }
  }
