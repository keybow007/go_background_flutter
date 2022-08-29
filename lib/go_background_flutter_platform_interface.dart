import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'go_background_flutter_method_channel.dart';

abstract class GoBackgroundFlutterPlatform extends PlatformInterface {
  /// Constructs a GoBackgroundFlutterPlatform.
  GoBackgroundFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static GoBackgroundFlutterPlatform _instance = MethodChannelGoBackgroundFlutter();

  /// The default instance of [GoBackgroundFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelGoBackgroundFlutter].
  static GoBackgroundFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GoBackgroundFlutterPlatform] when
  /// they register themselves.
  static set instance(GoBackgroundFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  //----ここまではプロジェクト作成段階で実装済み
  //  => インターフェイスクラスでは例外を投げるだけ（MethodChannelの呼び出しは継承先のmethod_channel.dartでオーバーライド）
  Future<void> goBackground() {
    throw UnimplementedError('goBackground() has not been implemented.');
  }
}
