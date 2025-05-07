import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';

class InternetConnectionChecker {
  // Use a HEAD request instead of GET for faster checks (no body downloaded)
  // Use a list of reliable endpoints in case one is down
  static const _testUrls = [
    'https://www.google.com',
    'https://www.cloudflare.com',
    'https://one.one.one.one',
  ];

  // Share a single Dio instance
  final Dio _dio = Dio();

  Future<bool> checkConnection() async {
    // Try each test URL sequentially until one succeeds
    for (final url in _testUrls) {
      try {
        final response = await _dio.head(url).timeout(
              const Duration(seconds: 3), // Shorter timeout for faster feedback
            );
        if (response.statusCode == 200) {
          return true;
        }
      } catch (e) {
        log('Internet Connection check failed for $url: $e');
        // Continue to next URL
      } finally {
        _dio.close();
      }
    }
    return false; // All attempts failed
  }

  // Clean up when done
  void dispose() {
    _dio.close();
  }
}
