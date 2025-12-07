import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Sign up
  Future<UserCredential> signUpWithEmailAndPass(String email,password)async{
    try{
      UserCredential userCredential= await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw e.code;
    }
  }
  // Sign in
  Future<UserCredential> signInWithEmailAndPass(String email,password)async{
    try{
      UserCredential userCredential= await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw e.code;
    }
  }

  // Sign out
  Future<void> signOut()async{
    return await _firebaseAuth.signOut();
  }


}
