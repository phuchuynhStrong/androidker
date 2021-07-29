import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

class NativeFirebaseService extends FirebaseService {
  @override
  Future<void> init() async {
    firebaseApp = await Firebase.initializeApp().catchError((Object e) {
      Logger().e("Firebase initialize failed: $e");
    });
    if (firebaseApp != null) {
      firestore = FirebaseFirestore.instanceFor(app: firebaseApp!);
      firebaseAuth = FirebaseAuth.instanceFor(app: firebaseApp!);
    }
  }
}
