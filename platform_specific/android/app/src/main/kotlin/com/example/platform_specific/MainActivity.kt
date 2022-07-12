package com.example.platform_specific

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel = "test_method_channel"
    private val eventChannel = "channel.test"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            if (call.method == "getBattery") {
                val battery: Int = getBatteryLevel()
                result.success(battery)
            } else if (call.method == "getWelcomeMessage") {
                val name: String? = call.argument<String>("name")
                if (name != null) {
                    result.success("Hello, $name")
                } else {
                    result.error("NULL_NAME_ERROR", "Please, send a name", null)
                }
            } else if (call.method == "int_list") {
                val list = listOf<Int>(1, 2, 3, 4, 5)
                result.success(list)
            } else if (call.method == "map_example") {
                val map = mapOf<String,Int>("1" to 1, "2" to 2, "3" to 3)
                result.success(map)
            } else if (call.method == "json_example") {
                val json: String = "[{\"name\":\"rafael\", \"age\":20}, {\"name\":\"arthur\", \"age\":20}]"
                result.success(json)
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannel).setStreamHandler(RandomNumberStreamHandler())
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }
}
