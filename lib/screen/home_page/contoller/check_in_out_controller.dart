import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckinTimeState {
  final DateTime? checkInTime;
  final List<Duration> sessions;
  // final double percentage; // ← Add this

  CheckinTimeState({this.checkInTime, this.sessions = const []});

  // Total minutes from all sessions
  double get totalMinutes =>
      sessions.fold(0, (sum, dur) => sum + dur.inMinutes.toDouble());

  // Percentage of 24 hours
  double get percentage => (totalMinutes / (24 * 60)) * 100;

  // CopyWith for state updates
  CheckinTimeState copyWith({DateTime? checkInTime, List<Duration>? sessions}) {
    return CheckinTimeState(
      checkInTime: checkInTime ?? this.checkInTime,
      sessions: sessions ?? this.sessions,
    );
  }
}

class CheckinTimeController extends StateNotifier<CheckinTimeState> {
  CheckinTimeController() : super(CheckinTimeState());

  // Main method: toggles between check-in and check-out
  void toggle() {
    if (state.checkInTime == null) {
      // Check-in: record start time
      state = state.copyWith(checkInTime: DateTime.now());
    } else {
      // Check-out: calculate session and update
      final duration = DateTime.now().difference(state.checkInTime!);
      final updatedSessions = List<Duration>.from(state.sessions)
        ..add(duration);

      state = state.copyWith(checkInTime: null, sessions: updatedSessions);
    }
  }

  // Optional: resets all data
  void reset() {
    state = CheckinTimeState();
  }
}

// 🌱 Riverpod provider
final checkinTimeProvider =
    StateNotifierProvider<CheckinTimeController, CheckinTimeState>((ref) {
      return CheckinTimeController();
    });
