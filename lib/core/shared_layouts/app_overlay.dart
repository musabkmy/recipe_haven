import 'package:flutter/material.dart';

///Global loading overlay that is sit above all widget tree
///Show loading overlay [LoadingOverlay.show]
///Hide loading overlay [LoadingOverlay.hide]
final class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent background
            child: Center(
              child: CircularProgressIndicator(), // Loading indicator
            ),
          ),
    );

    // Insert the overlay into the overlay stack
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove(); // Remove the overlay from the stack
      _overlayEntry = null;
    }
  }

  const LoadingOverlay._();
}
