import 'dart:io';

import 'package:androiker/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('rives assets test', () {
    expect(true, File(Rives.androidkerSplash).existsSync());
  });
}
