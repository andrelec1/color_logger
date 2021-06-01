import 'package:ansicolor/ansicolor.dart';

enum LogStatus {
  success,
  error,
  warning,
  info,
  debug,
}

class LogStatusHelper {
  static AnsiPen getColorPen(LogStatus status) {
    var color = 16;
    switch(status) {
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
    }

    return AnsiPen()
        ..reset()
        ..xterm(color)
      ;
  }

  static String getEmoji(LogStatus status) {
    switch(status) {
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
      default :
        return '❓';
    }
  }

  static String getStatusString(LogStatus status, {upperFirst = false, upperCase = false, fixedSize = true}) {
    var statusString = _getStatusString(status, fixedSize: fixedSize);

    if (upperFirst) {
      statusString = '${statusString[0].toUpperCase()}${statusString.substring(1)}';
    }

    if (upperCase) {
      statusString = statusString.toUpperCase();
    }

    return statusString;
  }

  static String _getStatusString(LogStatus status, { fixedSize = false }) {
    switch(status) {
      case LogStatus.success:
        return 'success';
      case LogStatus.error:
        return fixedSize ? ' error ' : 'error';
      case LogStatus.warning:
        return 'warning';
      case LogStatus.info:
        return fixedSize ? ' info  ' : 'info';
      case LogStatus.debug:
        return fixedSize ? ' debug ' : 'debug';
        break;
      default :
        return fixedSize ? '  ???  ' : '???';
    }
  }
}
