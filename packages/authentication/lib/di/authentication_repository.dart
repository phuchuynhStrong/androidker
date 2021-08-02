import 'package:authentication/model/signin_request.dart';
import 'package:authentication/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthenticationRepository {
  final FirebaseAuth? _firebaseAuth;
  final Logger? logger;

  AuthenticationRepository({
    @required FirebaseAuth? firebaseAuth,
    this.logger,
  }) : _firebaseAuth = firebaseAuth;

  bool isValid(SignInRequest? request) =>
      request?.email != null && request?.password != null;

  Future<AndroidkerUser?> signInWithEmailAndPassword(
      SignInRequest? request) async {
    assert(request != null && isValid(request));
    return _firebaseAuth
        ?.signInWithEmailAndPassword(
            email: request!.email!, password: request.password!)
        .then(
      (userCredential) {
        logger?.i("LOGIN SUCCESS: ${userCredential.toString()}");
        return AndroidkerUser(
          email: userCredential.user?.email,
          displayName: userCredential.user?.displayName,
          id: userCredential.user?.uid,
          photoUrl: userCredential.user?.photoURL,
        );
      },
    ).catchError((error) {
      logger?.e(error);
    });
  }
}
