package com.jiangkang.flutter_system

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun provideSplashScreen(): SplashScreen? {
        return LottieSplashScreen()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
                .platformViewsController
                .registry
                .registerViewFactory("demo_native_view",
                        DemoNativeViewFactory()
                )
    }

}
