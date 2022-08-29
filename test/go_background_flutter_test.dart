import 'package:flutter_test/flutter_test.dart';
import 'package:go_background_flutter/go_background_flutter.dart';
import 'package:go_background_flutter/go_background_flutter_platform_interface.dart';
import 'package:go_background_flutter/go_background_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGoBackgroundFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements GoBackgroundFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GoBackgroundFlutterPlatform initialPlatform = GoBackgroundFlutterPlatform.instance;

  test('$MethodChannelGoBackgroundFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGoBackgroundFlutter>());
  });

  test('getPlatformVersion', () async {
    GoBackgroundFlutter goBackgroundFlutterPlugin = GoBackgroundFlutter();
    MockGoBackgroundFlutterPlatform fakePlatform = MockGoBackgroundFlutterPlatform();
    GoBackgroundFlutterPlatform.instance = fakePlatform;
  
    expect(await goBackgroundFlutterPlugin.getPlatformVersion(), '42');
  });
}
