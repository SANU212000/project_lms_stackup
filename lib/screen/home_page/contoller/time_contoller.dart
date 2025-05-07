import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

final stopWatchProvider = Provider<StopWatchTimer>((ref) {
  final stopwatch = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('start'),
    onStopped: () => print('Stopped'),
    onEnded: () => print('Ended'),
  );

  ref.onDispose(() => stopwatch.dispose());
  return stopwatch;
});
final isRunningProvider = StateProvider<bool>((ref) => false);
