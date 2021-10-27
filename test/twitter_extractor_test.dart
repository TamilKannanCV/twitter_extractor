import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twitter_extractor/twitter_extractor.dart';

void main() {
  const MethodChannel channel = MethodChannel('twitter_extractor');

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
    expect(await TwitterExtractor.platformVersion, '42');
  });
}
