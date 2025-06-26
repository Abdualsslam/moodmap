import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'MoodMap'**
  String get appName;

  /// No description provided for @todayMood.
  ///
  /// In en, this message translates to:
  /// **'Today’s Mood'**
  String get todayMood;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you \nfeeling today?'**
  String get howAreYouFeeling;

  /// No description provided for @moodPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'What made you feel this way?'**
  String get moodPlaceholder;

  /// No description provided for @saveMood.
  ///
  /// In en, this message translates to:
  /// **'Save the Mood'**
  String get saveMood;

  /// No description provided for @tabToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tabToday;

  /// No description provided for @tabCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get tabCalendar;

  /// No description provided for @tabReflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections'**
  String get tabReflections;

  /// No description provided for @sampleDate.
  ///
  /// In en, this message translates to:
  /// **'Sunday, April 13, 2025'**
  String get sampleDate;

  /// No description provided for @emptyMoodWarning.
  ///
  /// In en, this message translates to:
  /// **'Please write something about your mood before saving.'**
  String get emptyMoodWarning;

  /// No description provided for @emptyMoodError.
  ///
  /// In en, this message translates to:
  /// **'Please select a mood before saving.'**
  String get emptyMoodError;

  /// No description provided for @emptyTextFieldError.
  ///
  /// In en, this message translates to:
  /// **'Please write something about your mood before saving.'**
  String get emptyTextFieldError;

  /// No description provided for @reflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections'**
  String get reflections;

  /// No description provided for @spaceForYourMood.
  ///
  /// In en, this message translates to:
  /// **'Space for your mood'**
  String get spaceForYourMood;

  /// No description provided for @moodCalendar.
  ///
  /// In en, this message translates to:
  /// **'Mood Calendar'**
  String get moodCalendar;

  /// No description provided for @savedMessg.
  ///
  /// In en, this message translates to:
  /// **'The mood was successfully saved ✅'**
  String get savedMessg;

  /// No description provided for @chooseModeFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose your mood first'**
  String get chooseModeFirst;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @shareMoodStats.
  ///
  /// In en, this message translates to:
  /// **'Check out my mood stats!'**
  String get shareMoodStats;

  /// No description provided for @shareSuccess.
  ///
  /// In en, this message translates to:
  /// **'Shared successfully!'**
  String get shareSuccess;

  /// No description provided for @shareError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sharing: '**
  String get shareError;

  /// No description provided for @moodCount.
  ///
  /// In en, this message translates to:
  /// **'Mood Count'**
  String get moodCount;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @hintMyMood.
  ///
  /// In en, this message translates to:
  /// **'My Mood today is'**
  String get hintMyMood;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @errorFutureDate.
  ///
  /// In en, this message translates to:
  /// **'You can\'t select future dates.'**
  String get errorFutureDate;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @filterTooltipActive.
  ///
  /// In en, this message translates to:
  /// **'Filter is active'**
  String get filterTooltipActive;

  /// No description provided for @filterTooltipInactive.
  ///
  /// In en, this message translates to:
  /// **'Filter by mood'**
  String get filterTooltipInactive;

  /// No description provided for @quoteCopied.
  ///
  /// In en, this message translates to:
  /// **'Quote copied to clipboard!'**
  String get quoteCopied;

  /// No description provided for @shareQuoteSubject.
  ///
  /// In en, this message translates to:
  /// **'Share quote'**
  String get shareQuoteSubject;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any favorites yet!'**
  String get noFavorites;

  /// No description provided for @quoteCopiedAr.
  ///
  /// In en, this message translates to:
  /// **'Quote copied!'**
  String get quoteCopiedAr;

  /// No description provided for @shareQuoteArSubject.
  ///
  /// In en, this message translates to:
  /// **'Share quote'**
  String get shareQuoteArSubject;

  /// No description provided for @toggleFavorite.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get toggleFavorite;

  /// No description provided for @madeWithLove.
  ///
  /// In en, this message translates to:
  /// **'Made with care by '**
  String get madeWithLove;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get unexpectedError;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get successful;

  /// No description provided for @thanksForSharing.
  ///
  /// In en, this message translates to:
  /// **'Thank you for sharing'**
  String get thanksForSharing;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @happy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get happy;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @bad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get bad;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'good'**
  String get good;

  /// No description provided for @awfull.
  ///
  /// In en, this message translates to:
  /// **'Awfull'**
  String get awfull;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// No description provided for @quote_1.
  ///
  /// In en, this message translates to:
  /// **'Your feelings are valid. Take a deep breath, you’re doing your best.'**
  String get quote_1;

  /// No description provided for @quote_2.
  ///
  /// In en, this message translates to:
  /// **'It’s okay to have bad days. You’re stronger than you think.'**
  String get quote_2;

  /// No description provided for @quote_3.
  ///
  /// In en, this message translates to:
  /// **'Every emotion you feel matters.'**
  String get quote_3;

  /// No description provided for @quote_4.
  ///
  /// In en, this message translates to:
  /// **'Progress is not linear. Keep moving forward.'**
  String get quote_4;

  /// No description provided for @quote_5.
  ///
  /// In en, this message translates to:
  /// **'Be kind to yourself. Growth takes time.'**
  String get quote_5;

  /// No description provided for @quote_6.
  ///
  /// In en, this message translates to:
  /// **'You are more than your bad moments.'**
  String get quote_6;

  /// No description provided for @quote_7.
  ///
  /// In en, this message translates to:
  /// **'Take a moment for yourself today.'**
  String get quote_7;

  /// No description provided for @quote_8.
  ///
  /// In en, this message translates to:
  /// **'Let go of what you can’t control.'**
  String get quote_8;

  /// No description provided for @quote_9.
  ///
  /// In en, this message translates to:
  /// **'Self-care is how you take your power back.'**
  String get quote_9;

  /// No description provided for @quote_10.
  ///
  /// In en, this message translates to:
  /// **'You don’t have to have it all figured out.'**
  String get quote_10;

  /// No description provided for @quote_11.
  ///
  /// In en, this message translates to:
  /// **'Healing isn’t always pretty, but it’s worth it.'**
  String get quote_11;

  /// No description provided for @quote_12.
  ///
  /// In en, this message translates to:
  /// **'You’re allowed to rest.'**
  String get quote_12;

  /// No description provided for @quote_13.
  ///
  /// In en, this message translates to:
  /// **'Today’s mood doesn’t define your whole journey.'**
  String get quote_13;

  /// No description provided for @quote_14.
  ///
  /// In en, this message translates to:
  /// **'Celebrate small victories.'**
  String get quote_14;

  /// No description provided for @quote_15.
  ///
  /// In en, this message translates to:
  /// **'Your journey is unique. Trust your process.'**
  String get quote_15;

  /// No description provided for @quote_16.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay to feel. Emotions make us human.'**
  String get quote_16;

  /// No description provided for @quote_17.
  ///
  /// In en, this message translates to:
  /// **'Lighten your heart. Tomorrow is a new day.'**
  String get quote_17;

  /// No description provided for @quote_18.
  ///
  /// In en, this message translates to:
  /// **'You’re not alone in how you feel.'**
  String get quote_18;

  /// No description provided for @quote_19.
  ///
  /// In en, this message translates to:
  /// **'Peace begins with a deep breath.'**
  String get quote_19;

  /// No description provided for @quote_20.
  ///
  /// In en, this message translates to:
  /// **'Speak to yourself with kindness.'**
  String get quote_20;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
