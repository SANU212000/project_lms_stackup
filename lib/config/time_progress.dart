
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimeProgress {
  final String formattedTime;
  final double percentage;

  TimeProgress(this.formattedTime, this.percentage);
}

TimeProgress getTimeProgress(int rawTime) {
  final time = StopWatchTimer.getDisplayTime(
    rawTime,
    milliSecond: false,
    hours: true,
    minute: true,
    second: true,
  );

  final percentage = (rawTime / 86400000) * 100;

  return TimeProgress(time, percentage.clamp(0, 100));
}
