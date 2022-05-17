import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      final materialIconsFontLoader = FontLoader('MaterialIcons');

      materialIconsFontLoader.addFont(
        File('assets/fonts/MaterialIcons-Regular.ttf').readAsBytes().then(
              (bytes) => ByteData.view(Uint8List.fromList(bytes).buffer),
            ),
      );

      materialIconsFontLoader.addFont(
        File('assets/fonts/MaterialIconsRound-Regular.otf').readAsBytes().then(
              (bytes) => ByteData.view(Uint8List.fromList(bytes).buffer),
            ),
      );

      await materialIconsFontLoader.load();
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(),
  );
}
