import 'package:bringr/core/error/exception.dart';
import 'package:bringr/feature/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const AuthRemoteDataSourceImpl(this.firebaseAuth, this.firebaseFirestore);
  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential response = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (response.user == null) {
        throw ServerException("User is null");
      }

      await firebaseFirestore.collection('users').doc(response.user!.uid).set({
        'id': response.user!.uid,
        'name': name,
        'email': email,
      });

      return UserModel(id: response.user!.uid, email: email, name: name);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
