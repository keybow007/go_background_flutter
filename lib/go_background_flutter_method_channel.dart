import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'go_background_flutter_platform_interface.dart';

/// An implementation of [GoBackgroundFlutterPlatform] that uses method channels.
class MethodChannelGoBackgroundFlutter extends GoBackgroundFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('go_background_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  //----ここまではプロジェクト作成段階で実装済み

  //３のインターフェイスクラスで定義したメソッドの本実装（オーバーライドさせる）
  @override
  Future<void> goBackground() async {
    await methodChannel.invokeMapMethod("goBackground");
  }


}
