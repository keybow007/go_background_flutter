package net.minpro.go_background_flutter

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** GoBackgroundFlutterPlugin */
class GoBackgroundFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
//class GoBackgroundFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  var activity: Activity? = null;

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "go_background_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }
    //Channelメソッドをif文で追加する
    if (call.method == "goBackground") {
      //minimize_appを踏襲
      //https://github.com/Vanethos/minimize_app_plugin/blob/master/android/src/main/kotlin/com/vanethos/minimize_app/MinimizeAppPlugin.kt
      this.activity?.moveTaskToBack(true);
      result.success(null)
    }

    else {
      result.notImplemented()
    }


    //プロジェクト作成時に実装されていたコードはこれ（これにChannelメソッドをif文で追加する）
//    if (call.method == "getPlatformVersion") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
//    } else {
//      result.notImplemented()
//    }
  }

  //----ここまではプロジェクト作成段階で実装済み

  //this.activityを使うためにActivityAwareインターフェイスを使用
  //https://api.flutter.dev/javadoc/io/flutter/embedding/engine/plugins/activity/ActivityAware.html
  //コーディングはminimize_appプラグイン踏襲
  //https://github.com/Vanethos/minimize_app_plugin/blob/master/android/src/main/kotlin/com/vanethos/minimize_app/MinimizeAppPlugin.kt
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding);
  }

  override fun onDetachedFromActivity() {}





}
