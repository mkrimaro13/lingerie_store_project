import 'package:flutter/foundation.dart';


/// Para futuras funcionalidades de Layout
/// Se planeará validar si es web o el ancho de la
/// pantalla.
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
