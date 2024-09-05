import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CalculatorViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
