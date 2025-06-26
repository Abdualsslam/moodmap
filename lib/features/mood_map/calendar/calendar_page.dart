import 'package:flutter/material.dart';
import 'package:mood_map/app/theme/text_styles.dart';
import 'package:mood_map/core/enums/enum.dart';
import 'package:mood_map/core/widgets/header_logo.dart';
import 'package:mood_map/features/mood_map/calendar/widgets/calendar_filter_bar.dart';
import 'package:mood_map/features/mood_map/calendar/widgets/filter_dialog.dart';
import 'package:mood_map/features/mood_map/calendar/widgets/mood_count_card.dart';
import 'package:mood_map/features/mood_map/calendar/widgets/mood_month_calendar.dart';
import 'package:mood_map/features/mood_map/calendar/widgets/mood_week_calendar.dart';
import 'package:mood_map/l10n/app_localizations.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  bool isWeekView = false;
  // متغير الفلتر
  MoodType? _selectedFilter;
  // المتغيرات الجديدة للأسبوع الحالي
  DateTime weekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday % 7));
  DateTime weekEnd = DateTime.now().add(Duration(days: 6 - DateTime.now().weekday % 7));

  void _onMonthChanged(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
  }

  void _onWeekChanged(DateTime start, DateTime end) {
    setState(() {
      weekStart = start;
      weekEnd = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF222C36) : Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const HeaderLogo(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.moodCalendar,
                    style: MoodTextStyles.bold4.copyWith(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  // Filter bar
                  CalendarFilterBar(
                    isWeekView: isWeekView,
                    onWeekTap: () => setState(() => isWeekView = true),
                    onMonthTap: () => setState(() => isWeekView = false),
                    selectedFilter: _selectedFilter,
                    onFilterTap: () async {
                      final result = await showDialog<MoodType>(
                        context: context,
                        builder: (_) => MoodCircleFilterDialog(selected: _selectedFilter),
                      );
                      setState(() {
                        _selectedFilter = result;
                      });
                    },
                  ),

                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        isWeekView
                            ? MoodWeekView(initialWeekStart: weekStart, onWeekChanged: _onWeekChanged, filter: _selectedFilter)
                            : MoodMonthView(
                              month: selectedMonth,
                              year: selectedYear,
                              onMonthChanged: _onMonthChanged,
                              filter: _selectedFilter,
                            ),
                  ),

                  const SizedBox(height: 10),
                  MoodCountCard(
                    month: !isWeekView ? selectedMonth : null,
                    year: !isWeekView ? selectedYear : null,
                    weekStart: isWeekView ? weekStart : null,
                    weekEnd: isWeekView ? weekEnd : null,
                    filter: _selectedFilter,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
