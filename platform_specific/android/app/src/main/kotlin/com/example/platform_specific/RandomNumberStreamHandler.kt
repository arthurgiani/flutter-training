package com.example.platform_specific

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import kotlin.random.Random

class RandomNumberStreamHandler: EventChannel.StreamHandler {
    private var sink: EventChannel.EventSink? = null
    private var handler: Handler? = null

    private val runnable = Runnable {
        sendNewRandomNumber()
    }

    private fun sendNewRandomNumber() {
        val randomNumber = Random.nextInt(100)
        sink?.success(randomNumber)
        handler?.postDelayed(runnable, 1000)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
        handler = Handler(Looper.getMainLooper())
        handler?.post(runnable)
    }

    override fun onCancel(arguments: Any?) {
        sink = null
        handler?.removeCallbacks(runnable)
    }
}