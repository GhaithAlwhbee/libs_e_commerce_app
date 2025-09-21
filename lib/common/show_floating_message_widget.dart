import 'package:flutter/material.dart';

void showFloatingMessage(
  BuildContext context,
  String text, {
  required bool status,
}) {
  final overlay = Overlay.of(context);
  // 1) Create the entry
  final entry = OverlayEntry(
    builder: (ctx) {
      return Positioned(
        left: 16,
        right: 16,
        bottom:
            MediaQuery.of(ctx).viewInsets.bottom +
            25, // adjust so it's above your sheet
        child: Material(
          color: Colors.white,
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: status ? Color(0xFF00C48C) : Color(0xFF882B2B),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Center(
              child: Text(text, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      );
    },
  );

  // 2) Insert it
  overlay.insert(entry);

  // 3) Remove it after a delay
  Future.delayed(Duration(seconds: 3), () => entry.remove());
}
