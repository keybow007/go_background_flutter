
import 'go_background_flutter_platform_interface.dart';

/*
* Developing plugin packages
* https://docs.flutter.dev/development/packages-and-plugins/developing-packages#plugin
*
* Federated plugins（プラットフォームごとにソースコードを分離したプラグイン）の３つの構成要素
*   ・１．app-facing package(go_background_flutter.dart)
*       アプリ側から直接アクセスするプラグインのAPI
*   ・２．platform package(go_background_flutter_method_channel.dart)
*       プラットフォーム固有のコードにアクセスするためのMethodChannel（３の本実装：extendsしている）
*       => プラットフォームコード（Channelメソッド）の実装はここで行う
*           （３のインターフェイスクラスで作成したメソッドをオーバーライド）
*   ・３．platform interface package(go_background_flutter_platform_interface.dart)
*       １と２を仲介するためのインターフェイス（１から２は直接呼び出さずに、このインターフェイスを経由させる）
*       => Channelメソッドは例外をthrowする部分だけ実装（呼び出し実装は２で行う => ２の継承先クラスでoverrideさせる）
*
* Calling platform-specific Android, iOS, and Windows code using platform channels
* （MethodChannelの話）
* https://docs.flutter.dev/development/platform-integration/platform-channels?tab=type-mappings-swift-tab#example
*
* */

//アプリ側から呼び出すAPI（１のapp-facing package）
class GoBackgroundFlutter {
  Future<String?> getPlatformVersion() {
    return GoBackgroundFlutterPlatform.instance.getPlatformVersion();
  }

  //----ここまではプロジェクト作成段階で実装済み
  Future<void> goBackground() {
    return GoBackgroundFlutterPlatform.instance.goBackground();
  }
}
