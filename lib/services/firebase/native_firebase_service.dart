import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

class NativeFirebaseService extends FirebaseService {
  @override
  Future<void> init() async {
    await Firebase.initializeApp().catchError((Object e) {
      Logger().e("$e");
    });
    print("InitComplete");
  }
}
