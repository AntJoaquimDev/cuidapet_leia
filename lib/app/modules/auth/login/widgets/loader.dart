import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class Loader {
  static OverlayEntry? _entry;
  static bool _open = false;

  Loader._();

  static void show() {
    _entry ??= OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        );
      },
    );

    if (!_open) {
      _open = true;
      asuka.Asuka.addOverlay(_entry!);
    }
  }

  static void hide() {
    if (_open) {
      _open = false;
      _entry?.remove();
    }
  }
}
