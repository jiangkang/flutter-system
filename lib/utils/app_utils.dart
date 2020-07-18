/// 是否为Release模式
const bool isReleaseMode = const bool.fromEnvironment("dart.vm.product");

/// 判断是否为Debug模式
bool isDebug() {
  bool inDebug = false;
  assert(inDebug = true);
  return inDebug;
}
