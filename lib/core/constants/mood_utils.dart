import 'package:flutter/material.dart';
import 'package:mood_map/core/constants/colors.dart';
import 'package:mood_map/core/constants/emojis.dart';
import 'package:mood_map/core/enums/enum.dart';
import 'package:mood_map/l10n/app_localizations.dart';

List<Map<String, Object>> getMoodList(BuildContext context) => [
  {'type': MoodType.happy, 'icon': MoodEmoji.happy, 'label': AppLocalizations.of(context)!.happy, 'color': MoodColors.happyNormal},
  {'type': MoodType.good, 'icon': MoodEmoji.good, 'label': AppLocalizations.of(context)!.good, 'color': MoodColors.goodNormal},
  {'type': MoodType.okay, 'icon': MoodEmoji.okay, 'label': AppLocalizations.of(context)!.okay, 'color': MoodColors.okNormal},
  {'type': MoodType.bad, 'icon': MoodEmoji.bad, 'label': AppLocalizations.of(context)!.bad, 'color': MoodColors.badNormal},
  {'type': MoodType.awfull, 'icon': MoodEmoji.awfull, 'label': AppLocalizations.of(context)!.awfull, 'color': MoodColors.awfulNormal},
];
