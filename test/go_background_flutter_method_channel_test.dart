import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_background_flutter/go_background_flutter_method_channel.dart';

void main() {
  MethodChannelGoBackgroundFlutter platform = MethodChannelGoBackgroundFlutter();
  const MethodChannel channel = MethodChannel('go_background_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
