package com.example.tugas

import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  companion object{
    var CHANNEL = "toast.flutter.io/toast"
  }
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler{
      call, result->
      if(call.method.equals("showToast")){
        Toast.makeText(applicationContext,"Lokasi tidak ditemukan",Toast.LENGTH_LONG).show();
      }else
        result.notImplemented();
    }

  }
}
