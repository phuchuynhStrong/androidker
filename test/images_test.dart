import 'dart:io';

import 'package:androiker/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('images assets test', () {
    expect(true, File(Images.testBackground).existsSync());
    expect(true, File(Images.coolerImage).existsSync());
    expect(true, File(Images.background).existsSync());
    expect(true, File(Images.mainImage).existsSync());
  });
}
