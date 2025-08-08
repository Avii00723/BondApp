class AppLogger {
  static void logInfo(String message) {
    print('ℹ️ INFO: $message');
  }

  static void logError(String message, [dynamic error]) {
    print('❌ ERROR: $message');
    if (error != null) {
      print('   Details: $error');
    }
  }

  static void logSuccess(String message) {
    print('✅ SUCCESS: $message');
  }

  static void logWarning(String message) {
    print('⚠️ WARNING: $message');
  }

  static void logApi(String endpoint, int statusCode, [String? response]) {
    print('📡 API: $endpoint - Status: $statusCode');
    if (response != null && response.length < 200) {
      print('   Response: $response');
    }
  }
}