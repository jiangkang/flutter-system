import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:flutter_system/frouter/router.dart';
import 'package:source_gen/source_gen.dart';

/// 基于注解的生成器
class RouterGenerator extends GeneratorForAnnotation<Router> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    String className = element.displayName;
    String routerName = annotation.peek("name").stringValue;
    return "final maps = {'$routerName':${element.name}()}";
  }
}
