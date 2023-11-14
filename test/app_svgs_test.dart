import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_training/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.calendar).existsSync(), isTrue);
    expect(File(AppSvgs.contacts).existsSync(), isTrue);
    expect(File(AppSvgs.settings).existsSync(), isTrue);
  });
}
