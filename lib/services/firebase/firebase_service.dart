import 'package:androiker/services/firebase/native_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseFactory {
  static bool _initComplete = false;

  static FirebaseService create() {
    // TODO: Suport Desktop Firebase Service;
    FirebaseService service = NativeFirebaseService();

    if (_initComplete == false) {
      _initComplete = true;
      service.init();
    }

    return service;
  }
}

abstract class FirebaseService {
  void init();

  FirebaseApp? firebaseApp;
  FirebaseFirestore? firestore;
}
