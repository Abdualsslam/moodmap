import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive;
import 'package:mood_map/app/home_page.dart';
import 'package:mood_map/app/theme/theme.dart';
import 'package:mood_map/features/data/local/hive_initializer.dart';
import 'package:mood_map/features/data/models/mood_entry.dart';
import 'package:mood_map/features/provider/Favorite_provider.dart';
import 'package:mood_map/features/provider/mood_provider.dart';
import 'package:mood_map/features/provider/app_settings_provider.dart';
import 'package:mood_map/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  final moodBox = Hive.box<MoodEntry>('mood_box');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettingsProvider()..loadSettings()),

        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => MoodProvider(moodBox)),
      ],
      child: const MoodMap(),
    ),
  );
}

class MoodMap extends StatelessWidget {
  const MoodMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsProvider>(
      builder: (context, settings, _) {
        if (settings.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        final locale = Locale(settings.language);
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,
          supportedLocales: const [Locale('en'), Locale('ar')],
          theme: MoodTheme.lightTheme(settings.language),
          darkTheme: MoodTheme.darkTheme(settings.language),
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
