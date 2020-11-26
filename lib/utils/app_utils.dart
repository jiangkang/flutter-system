import 'package:flutter/foundation.dart';

/// 是否为Release模式
const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");

/// 判断是否为Debug模式
bool isDebug() {
  return kDebugMode;
}

/// 判断编译模式
String getCompileMode() {
  if (kDebugMode) {
    return "debug";
  } else if (kProfileMode) {
    return "profile";
  } else if (kReleaseMode) {
    return "release";
  } else {
    return "Unknown type";
  }
}
