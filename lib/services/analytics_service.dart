import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  void logEvent(String eventName, [Map<String, dynamic>? parameters]) {
    _analytics.logEvent(name: eventName, parameters: parameters);
  }
}
