import 'package:build/build.dart';
import 'package:flutter_system/frouter/router_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder routerBuilder(BuilderOptions options) =>
    LibraryBuilder(RouterGenerator(), generatedExtension: '.router.dart');
