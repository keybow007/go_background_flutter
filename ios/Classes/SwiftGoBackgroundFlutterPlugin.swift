import Flutter
import UIKit

//TODO ios側のプラグイン実装は「Swiftプラグイン名FlutterPlugin.swift」ファイルで行う
public class SwiftGoBackgroundFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "go_background_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftGoBackgroundFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //TODO ここがAndroidでいう（onMethodCall）にあたるところ
    //実装はminimize_appから踏襲
    //https://github.com/Vanethos/minimize_app_plugin/blob/master/ios/Classes/SwiftMinimizeAppPlugin.swift
      if (call.method == "goBackground") {
          UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
          result(nil)
      }
      //result("iOS " + UIDevice.current.systemVersion)
  }
}
