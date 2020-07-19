/// 是否为Release模式
const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");

/// 判断是否为Debug模式
bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true);
  return inDebug;
}

/// 判断编译模式
String getCompileMode() {
  const bool isProfile = const bool.fromEnvironment("dart.vm.profile");
  const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");
  if (isDebug()) {
    return "debug";
  } else if (isProfile) {
    return "profile";
  } else if (isReleaseMode) {
    return "release";
  } else {
    return "Unknown type";
  }
}
