/// Router注解
class Router {
  final String name;
  final Map<String, dynamic> args;

  const Router(this.name, {this.args});
  @override
  String toString() => "Router";
}
