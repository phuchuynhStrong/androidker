import 'package:androiker/core_packages.dart';
import 'package:authentication/di/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModule {
  late final AuthenticationRepository? authenticationRepository;

  AuthModule({
    @required FirebaseAuth? firebaseAuth,
    Logger? logger,
  }) : authenticationRepository = AuthenticationRepository(
          firebaseAuth: firebaseAuth,
          logger: logger,
        );
}
