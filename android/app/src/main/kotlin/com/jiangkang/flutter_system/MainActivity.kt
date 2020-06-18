package com.jiangkang.flutter_system

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

class MainActivity : FlutterActivity() {

    override fun provideSplashScreen(): SplashScreen? {
        return LottieSplashScreen()
    }

}
