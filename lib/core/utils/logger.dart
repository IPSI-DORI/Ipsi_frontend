// 개발용 디버그 로그 함수

void debugLog(dynamic message) {
  assert(() {
    print("🔥 [DEBUG] $message");
    return true;
  }());
}