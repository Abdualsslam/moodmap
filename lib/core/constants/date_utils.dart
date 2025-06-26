// lib/utils/date_utils.dart

import 'package:flutter/widgets.dart';
import 'package:mood_map/l10n/app_localizations.dart';

String monthName(int month, BuildContext context) {
  final names = [
    AppLocalizations.of(context)!.january,
    AppLocalizations.of(context)!.february,
    AppLocalizations.of(context)!.march,
    AppLocalizations.of(context)!.april,
    AppLocalizations.of(context)!.may,
    AppLocalizations.of(context)!.june,
    AppLocalizations.of(context)!.july,
    AppLocalizations.of(context)!.august,
    AppLocalizations.of(context)!.september,
    AppLocalizations.of(context)!.october,
    AppLocalizations.of(context)!.november,
    AppLocalizations.of(context)!.december,
  ];
  return names[month - 1];
}

String weekDayName(int dayIndex, BuildContext context) {
  // dayIndex: 0=Sun, 1=Mon, ...6=Sat
  final names = [
    AppLocalizations.of(context)!.sunday,
    AppLocalizations.of(context)!.monday,
    AppLocalizations.of(context)!.tuesday,
    AppLocalizations.of(context)!.wednesday,
    AppLocalizations.of(context)!.thursday,
    AppLocalizations.of(context)!.friday,
    AppLocalizations.of(context)!.saturday,
  ];
  return names[dayIndex];
}
