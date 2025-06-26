import 'package:flutter/material.dart';
import 'package:mood_map/core/constants/emojis.dart';

Future<void> errorDialog(BuildContext context, String textErorr) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(MoodEmoji.noEmoji, width: 64, height: 64),
                const SizedBox(height: 16),
                Center(
                  child: Text(textErorr, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
  );
}
