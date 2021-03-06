import 'package:color_logger/color_logger.dart';
import 'package:test/test.dart';

void main() {
  group('FixedLength', () {
    var size = 7;
    test('None/Default', () {
      var s = LogStatusHelper.getStatusString(LogStatus.none, fixedSize: true);
      expect(s.length, size);
    });

    test('Success', () {
      var s =
          LogStatusHelper.getStatusString(LogStatus.success, fixedSize: true);
      expect(s.length, size);
    });

    test('Error', () {
      var s = LogStatusHelper.getStatusString(LogStatus.error, fixedSize: true);
      expect(s.length, size);
    });

    test('Warning', () {
      var s =
          LogStatusHelper.getStatusString(LogStatus.success, fixedSize: true);
      expect(s.length, size);
    });

    test('Info', () {
      var s =
          LogStatusHelper.getStatusString(LogStatus.success, fixedSize: true);
      expect(s.length, size);
    });

    test('Debug', () {
      var s =
          LogStatusHelper.getStatusString(LogStatus.success, fixedSize: true);
      expect(s.length, size);
    });
  });
}
