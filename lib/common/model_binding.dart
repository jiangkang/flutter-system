import "package:flutter/material.dart";

class ModelBinding extends StatefulWidget {
  final AppSettings initialSettings;
  final Widget? child;

  const ModelBinding({
    Key? key,
    this.initialSettings = const AppSettings(),
    this.child,
  }) : super(key: key);

  @override
  ModelBindingState createState() => ModelBindingState();
}

class ModelBindingState extends State<ModelBinding> {
  AppSettings? currentSettings;

  @override
  void initState() {
    super.initState();
    currentSettings = widget.initialSettings;
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child!,
    );
  }

  void updateModel(AppSettings newSettings) {
    if (newSettings != currentSettings) {
      setState(() {
        currentSettings = newSettings;
      });
    }
  }
}

class _ModelBindingScope extends InheritedWidget {
  final ModelBindingState modelBindingState;

  const _ModelBindingScope({Key? key, required this.modelBindingState, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) {
    return true;
  }
}

class AppSettings {
  const AppSettings({
    this.themeData,
    this.locale,
  });

  final ThemeData? themeData;
  final Locale? locale;

  static AppSettings? of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentSettings;
  }

  static void update(BuildContext context, AppSettings newSettings) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    scope.modelBindingState.updateModel(newSettings);
  }
}
