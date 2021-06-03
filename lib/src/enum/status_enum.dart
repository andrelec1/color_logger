import 'package:ansicolor/ansicolor.dart';

/// Enum of Status
enum LogStatus {
  none,
  success,
  error,
  warning,
  info,
  debug,
}

/// Static class helper for the enum
class LogStatusHelper {
  /// get the AnsiPen With the right color from the LogStatus
  static AnsiPen getColorPen(LogStatus status) {
    var color = 15;
    switch (status) {
      case LogStatus.success:
        color = 10;
        break;
      case LogStatus.error:
        color = 9;
        break;
      case LogStatus.warning:
        color = 3;
        break;
      case LogStatus.info:
        color = 13;
        break;
      case LogStatus.debug:
        color = 4;
        break;
      case LogStatus.none:
        color = 15;
        break;
    }

    return AnsiPen()
      ..reset()
      ..xterm(color);
  }

  /// Get the emoji from the LogStatus
  static String getEmoji(LogStatus status) {
    switch (status) {
      case LogStatus.success:
        return '🟢';
      case LogStatus.error:
        return '🔴';
      case LogStatus.warning:
        return '🟠';
      case LogStatus.info:
        return '🟣';
      case LogStatus.debug:
        return '🔵';
      case LogStatus.none:
      default:
        return '⚪️';
    }
  }

  /// Apply some transformation on the string for better look
  static String getStatusString(LogStatus status,
      {upperFirst = false, upperCase = false, fixedSize = true}) {
    var statusString = _getStatusString(status, fixedSize: fixedSize);

    if (upperFirst) {
      statusString =
          '${statusString[0].toUpperCase()}${statusString.substring(1)}';
    }

    if (upperCase) {
      statusString = statusString.toUpperCase();
    }

    return statusString;
  }

  /// Return string terms with space for better look at output
  static String _getStatusString(LogStatus status, {fixedSize = false}) {
    var stringValue = '???';
    switch (status) {
      case LogStatus.success:
        stringValue = 'success';
        break;
      case LogStatus.error:
        stringValue = 'error';
        break;
      case LogStatus.warning:
        stringValue = 'warning';
        break;
      case LogStatus.info:
        stringValue = 'info';
        break;
      case LogStatus.debug:
        stringValue = 'debug';
        break;
      case LogStatus.none:
        stringValue = 'default';
        break;
      default:
        stringValue = '???';
        break;
    }

    return fixedSize ? _centerPad(stringValue) : stringValue;
  }

  /// Automatic center pad string
  static String _centerPad(String status, {wantedLength = 7}) {
    // if status length is bigger thant the wanted size, just return.
    if (status.length >= wantedLength) {
      return status;
    }

    var currentLength = status.length;
    int leftPad = ((wantedLength - currentLength) / 2).ceil();
    int rightPad = (wantedLength - currentLength - leftPad).ceil();

    for (var i = 0; i < leftPad; i++) {
      status = ' $status';
    }

    for (var i = 0; i < rightPad; i++) {
      status = '$status ';
    }

    return status;
  }
}
