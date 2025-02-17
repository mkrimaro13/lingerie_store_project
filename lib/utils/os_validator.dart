import 'package:flutter/foundation.dart';

bool get isOnDesktopAndWeb =>
    kIsWeb ||
    switch (defaultTargetPlatform) {
      TargetPlatform.macOS ||
      TargetPlatform.linux ||
      TargetPlatform.windows =>
        true,
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia =>
        false,
    };
