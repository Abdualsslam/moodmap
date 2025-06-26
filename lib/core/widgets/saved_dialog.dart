import 'package:flutter/material.dart';
import 'package:mood_map/core/constants/icons.dart';
import 'package:mood_map/l10n/app_localizations.dart';

Future<void> savedDialog(BuildContext context) {
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
                Image.asset(MoodIcons.logo, width: 64, height: 64),
                const SizedBox(height: 16),
                Text(AppLocalizations.of(context)!.thanksForSharing, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
        ),
  );
}
