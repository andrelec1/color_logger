import 'package:color_logger/src/enum/status_enum.dart';

class ColorLogger {
  /// Output log timestamped with color and emoji
  void log(String text, {LogStatus status = LogStatus.none}) {
    var timestamping = _getTimestamping();
    var emoji = LogStatusHelper.getEmoji(status);
    var statusString = LogStatusHelper.getStatusString(status, upperCase: true);
    var pen = LogStatusHelper.getColorPen(status);
    print(pen('[$timestamping][$emoji $statusString] $text'));
  }

  /// Add leading zero for making string with 2 digits everytime.
  String _to2digit(int base) {
    var baseString = '0$base';
    return baseString.substring(baseString.length - 2);
  }

  /// Add leading zero for making string with 3 digits everytime.
  String _to3digit(int base) {
    var baseString = '00$base';
    return baseString.substring(baseString.length - 3);
  }

  /// Generate a string with datetime.
  String _getTimestamping() {
    var now = DateTime.now();
    var y = now.year.toString();
    var m = _to2digit(now.month);
    var d = _to2digit(now.day);
    var h = _to2digit(now.hour);
    var min = _to2digit(now.minute);
    var sec = _to2digit(now.second);
    var ms = _to3digit(now.millisecond);

    return '$y-$m-$d $h:$min:$sec.$ms';
  }
}
