import 'package:flutter/material.dart';

class KRoute extends MaterialPageRoute<dynamic> {

  @override
  dynamic get currentResult => getCurrentResult();

  KRoute({builder, settings, maintainState = true, fullscreenDialog = false})
      : super(builder: builder, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog);

  dynamic getCurrentResult() {
    return "DefaultValue";
  }
}
