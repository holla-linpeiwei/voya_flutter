import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voya_flutter/voya_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('voya_flutter');

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
    expect(await VoyaFlutter.platformVersion, '42');
  });
}
