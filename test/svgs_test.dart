import 'dart:io';

import 'package:androiker/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('svgs assets test', () {
    expect(true, File(Svgs.androidker).existsSync());
  });
}
