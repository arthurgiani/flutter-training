package com.example.myapplication

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

class TestFlutterActivity: FlutterActivity() {
    private val channel = "native.app/test"

    companion object {
        fun withCachedEngine(engineId: String) = CustomCachedEngineIntentBuilder(engineId)
    }

    class CustomCachedEngineIntentBuilder(engine_id: String) :
        CachedEngineIntentBuilder(TestFlutterActivity::class.java, engine_id)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(FlutterEngineCache.getInstance()["any_engine_id"]!!)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
                call, result ->
            if(call.method == "exitModule") {
                this.finish()
            } else {
                result.notImplemented()
            }
        }
    }
}