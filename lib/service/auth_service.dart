import 'dart:ffi';
import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //--------------------firebase instace-------------------
  FirebaseAuth _auth = FirebaseAuth.instance;

  //--------------------firebase instace-------------------

  Future<void> registerProcess (String _email,String _Password) async {
    try {
      final Credential = await _auth.createUserWithEmailAndPassword(
    email: _email,
    password: _Password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The Password provided is too weak.');
    } else if (e.code == 'email-alredy-in-use') {
      print('The account already exist for that email.');
    }
      } catch (e) {
        print (e);
      }
  }
}