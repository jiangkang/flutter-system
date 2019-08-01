package com.jiangkang.flutter_system

import android.os.Bundle
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result -> runOnUiThread { Toast.makeText(this@MainActivity, call.arguments.toString(), Toast.LENGTH_SHORT).show() } }
    }


    companion object {

        private val CHANNEL = "com.jiangkang.flutter_system/toast"
    }
}
