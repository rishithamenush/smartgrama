import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_si.dart';
import 'app_localizations_ta.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('si'),
    Locale('ta'),
  ];

  /// Subtitle under the app name
  ///
  /// In en, this message translates to:
  /// **'Grama Niladhari division records'**
  String get appTagline;

  /// No description provided for @dbOpenError.
  ///
  /// In en, this message translates to:
  /// **'Could not open the database.\n\n{error}'**
  String dbOpenError(String error);

  /// System fingerprint/face prompt
  ///
  /// In en, this message translates to:
  /// **'To unlock SmartGrama'**
  String get biometricReason;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @confirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmTitle;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchHint;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get notFound;

  /// No description provided for @nothingHere.
  ///
  /// In en, this message translates to:
  /// **'Nothing here'**
  String get nothingHere;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @ageN.
  ///
  /// In en, this message translates to:
  /// **'Age {age}'**
  String ageN(int age);

  /// No description provided for @resultsN.
  ///
  /// In en, this message translates to:
  /// **'Results: {count}'**
  String resultsN(int count);

  /// Land record status
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get statusDraft;

  /// Land record status
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get statusComplete;

  /// Land record status
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get statusVerified;

  /// No description provided for @land.
  ///
  /// In en, this message translates to:
  /// **'Land'**
  String get land;

  /// No description provided for @lands.
  ///
  /// In en, this message translates to:
  /// **'Lands'**
  String get lands;

  /// No description provided for @buildings.
  ///
  /// In en, this message translates to:
  /// **'Buildings'**
  String get buildings;

  /// No description provided for @families.
  ///
  /// In en, this message translates to:
  /// **'Families'**
  String get families;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// Individual persons (counts, search sections)
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get persons;

  /// No description provided for @person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get person;

  /// Land card tab / wizard step
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// No description provided for @trees.
  ///
  /// In en, this message translates to:
  /// **'Trees'**
  String get trees;

  /// No description provided for @animals.
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get animals;

  /// No description provided for @houses.
  ///
  /// In en, this message translates to:
  /// **'Houses'**
  String get houses;

  /// No description provided for @crops.
  ///
  /// In en, this message translates to:
  /// **'Crops'**
  String get crops;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @treesAndCrops.
  ///
  /// In en, this message translates to:
  /// **'Trees & crops'**
  String get treesAndCrops;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @population.
  ///
  /// In en, this message translates to:
  /// **'Population'**
  String get population;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @valuableTrees.
  ///
  /// In en, this message translates to:
  /// **'Valuable trees'**
  String get valuableTrees;

  /// No description provided for @valuableTimberTrees.
  ///
  /// In en, this message translates to:
  /// **'Valuable / timber trees'**
  String get valuableTimberTrees;

  /// No description provided for @countedTrees.
  ///
  /// In en, this message translates to:
  /// **'Counted trees'**
  String get countedTrees;

  /// No description provided for @dilapidatedHouses.
  ///
  /// In en, this message translates to:
  /// **'Dilapidated houses'**
  String get dilapidatedHouses;

  /// No description provided for @landsWithDisputes.
  ///
  /// In en, this message translates to:
  /// **'Lands with disputes'**
  String get landsWithDisputes;

  /// No description provided for @adultsWithoutNic.
  ///
  /// In en, this message translates to:
  /// **'Adults without an NIC number (16+)'**
  String get adultsWithoutNic;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get languageChoose;

  /// No description provided for @languageChangeLater.
  ///
  /// In en, this message translates to:
  /// **'You can change this later in Settings.'**
  String get languageChangeLater;

  /// No description provided for @languageDataUnchanged.
  ///
  /// In en, this message translates to:
  /// **'Only the display language changes; your data stays the same.'**
  String get languageDataUnchanged;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// No description provided for @navMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMap;

  /// No description provided for @navReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navReports;

  /// No description provided for @pinEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN'**
  String get pinEnter;

  /// No description provided for @pinCreate.
  ///
  /// In en, this message translates to:
  /// **'Create a new 6-digit PIN'**
  String get pinCreate;

  /// No description provided for @pinConfirm.
  ///
  /// In en, this message translates to:
  /// **'Enter the PIN again'**
  String get pinConfirm;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'The PINs don\'t match — try again'**
  String get pinMismatch;

  /// No description provided for @pinLockedOut.
  ///
  /// In en, this message translates to:
  /// **'5 wrong attempts — wait 30 seconds'**
  String get pinLockedOut;

  /// No description provided for @pinWrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN'**
  String get pinWrong;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @welcomeName.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeName(String name);

  /// No description provided for @dashIssues.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item needs checking} other{{count} items need checking}}'**
  String dashIssues(int count);

  /// No description provided for @dashIssuesHint.
  ///
  /// In en, this message translates to:
  /// **'NICs, GPS, photos, duplicates…'**
  String get dashIssuesHint;

  /// No description provided for @dashAtAGlance.
  ///
  /// In en, this message translates to:
  /// **'Division at a glance'**
  String get dashAtAGlance;

  /// No description provided for @dashMaleFemale.
  ///
  /// In en, this message translates to:
  /// **'M {male} • F {female}'**
  String dashMaleFemale(int male, int female);

  /// No description provided for @dashQuickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick access'**
  String get dashQuickAccess;

  /// No description provided for @dashLists.
  ///
  /// In en, this message translates to:
  /// **'Lists'**
  String get dashLists;

  /// No description provided for @dashVillageProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress by village'**
  String get dashVillageProgress;

  /// No description provided for @dashNoVillages.
  ///
  /// In en, this message translates to:
  /// **'No villages yet — add them in Settings.'**
  String get dashNoVillages;

  /// No description provided for @dashExpectedHint.
  ///
  /// In en, this message translates to:
  /// **'Tip: fill in \"Approx. number of lands / houses\" under Settings → Villages & house groups to show accurate progress.'**
  String get dashExpectedHint;

  /// No description provided for @surveyProgress.
  ///
  /// In en, this message translates to:
  /// **'Survey progress'**
  String get surveyProgress;

  /// No description provided for @placesDone.
  ///
  /// In en, this message translates to:
  /// **'{done} of {target} places complete'**
  String placesDone(int done, int target);

  /// No description provided for @todayN.
  ///
  /// In en, this message translates to:
  /// **'Today {count}'**
  String todayN(int count);

  /// No description provided for @verifiedN.
  ///
  /// In en, this message translates to:
  /// **'Verified {count}'**
  String verifiedN(int count);

  /// No description provided for @newPlaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a new place'**
  String get newPlaceTitle;

  /// No description provided for @newPlaceSub.
  ///
  /// In en, this message translates to:
  /// **'Land • Buildings • Families • Trees • Animals'**
  String get newPlaceSub;

  /// No description provided for @landsSummary.
  ///
  /// In en, this message translates to:
  /// **'Lands {all} • Complete {done}'**
  String landsSummary(int all, int done);

  /// No description provided for @newPlace.
  ///
  /// In en, this message translates to:
  /// **'New place'**
  String get newPlace;

  /// No description provided for @allVillages.
  ///
  /// In en, this message translates to:
  /// **'All villages'**
  String get allVillages;

  /// No description provided for @allGroups.
  ///
  /// In en, this message translates to:
  /// **'All groups'**
  String get allGroups;

  /// No description provided for @landsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No lands here.\nTap \"{button}\" to add one.'**
  String landsEmpty(String button);

  /// No description provided for @searchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'People, lands, buildings'**
  String get searchSubtitle;

  /// No description provided for @searchFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Name, NIC, land, deed number…'**
  String get searchFieldHint;

  /// No description provided for @searchEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Type a name, NIC number, phone number,\nland name or deed number'**
  String get searchEmptyHint;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get searchNoResults;

  /// No description provided for @mapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lands, houses and valuable trees on the map'**
  String get mapSubtitle;

  /// No description provided for @mapLandCounts.
  ///
  /// In en, this message translates to:
  /// **'Buildings {buildings} • People {persons} • Trees {trees} • Animals {animals}'**
  String mapLandCounts(int buildings, int persons, int trees, int animals);

  /// No description provided for @openLand.
  ///
  /// In en, this message translates to:
  /// **'Open land'**
  String get openLand;

  /// No description provided for @mapNoGps.
  ///
  /// In en, this message translates to:
  /// **'No lands with GPS yet. Tap \"{button}\" when adding a land.'**
  String mapNoGps(String button);

  /// No description provided for @reportsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Statistics, lists, data checks'**
  String get reportsSubtitle;

  /// No description provided for @exportWarning.
  ///
  /// In en, this message translates to:
  /// **'The Excel file contains all personal details (names, NIC numbers, phone numbers).\nShare it securely, for official work only.'**
  String get exportWarning;

  /// No description provided for @exportAction.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get exportAction;

  /// No description provided for @statsTitle.
  ///
  /// In en, this message translates to:
  /// **'Division statistics'**
  String get statsTitle;

  /// No description provided for @statsHubSub.
  ///
  /// In en, this message translates to:
  /// **'Population, houses, lands, trees, animals'**
  String get statsHubSub;

  /// No description provided for @readyListsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready-made lists'**
  String get readyListsTitle;

  /// No description provided for @readyListsHubSub.
  ///
  /// In en, this message translates to:
  /// **'{total} lists • {withData} with data'**
  String readyListsHubSub(int total, int withData);

  /// No description provided for @qualityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data checks'**
  String get qualityTitle;

  /// No description provided for @qualityNoIssues.
  ///
  /// In en, this message translates to:
  /// **'No issues'**
  String get qualityNoIssues;

  /// No description provided for @qualityToCheckShort.
  ///
  /// In en, this message translates to:
  /// **'{count} to check'**
  String qualityToCheckShort(int count);

  /// No description provided for @qualityToCheck.
  ///
  /// In en, this message translates to:
  /// **'{count} to check'**
  String qualityToCheck(int count);

  /// No description provided for @qualityAllGood.
  ///
  /// In en, this message translates to:
  /// **'All good ✓'**
  String get qualityAllGood;

  /// No description provided for @excelExport.
  ///
  /// In en, this message translates to:
  /// **'Excel export'**
  String get excelExport;

  /// No description provided for @excelExportSub.
  ///
  /// In en, this message translates to:
  /// **'All data in one file'**
  String get excelExportSub;

  /// No description provided for @wholeDivision.
  ///
  /// In en, this message translates to:
  /// **'Whole division'**
  String get wholeDivision;

  /// No description provided for @statsLive.
  ///
  /// In en, this message translates to:
  /// **'Live — updates automatically as you enter data'**
  String get statsLive;

  /// No description provided for @awayN.
  ///
  /// In en, this message translates to:
  /// **'Temporarily away {count}'**
  String awayN(int count);

  /// No description provided for @statAgeGroups.
  ///
  /// In en, this message translates to:
  /// **'Age groups'**
  String get statAgeGroups;

  /// No description provided for @statDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disability'**
  String get statDisabled;

  /// No description provided for @statVoters.
  ///
  /// In en, this message translates to:
  /// **'Voters (18+)'**
  String get statVoters;

  /// No description provided for @statHousesPermanence.
  ///
  /// In en, this message translates to:
  /// **'Houses — permanence'**
  String get statHousesPermanence;

  /// No description provided for @statHousesCondition.
  ///
  /// In en, this message translates to:
  /// **'Houses — condition'**
  String get statHousesCondition;

  /// No description provided for @statToilets.
  ///
  /// In en, this message translates to:
  /// **'Toilets'**
  String get statToilets;

  /// No description provided for @statAllBuildings.
  ///
  /// In en, this message translates to:
  /// **'All buildings'**
  String get statAllBuildings;

  /// No description provided for @statTotalExtent.
  ///
  /// In en, this message translates to:
  /// **'Total extent'**
  String get statTotalExtent;

  /// No description provided for @statLandsOwnership.
  ///
  /// In en, this message translates to:
  /// **'Lands — ownership'**
  String get statLandsOwnership;

  /// No description provided for @statLandsUse.
  ///
  /// In en, this message translates to:
  /// **'Lands — use'**
  String get statLandsUse;

  /// No description provided for @statTreesCounted.
  ///
  /// In en, this message translates to:
  /// **'Trees (counted)'**
  String get statTreesCounted;

  /// No description provided for @statCropsPerches.
  ///
  /// In en, this message translates to:
  /// **'Crops (perches)'**
  String get statCropsPerches;

  /// No description provided for @statCropsPlants.
  ///
  /// In en, this message translates to:
  /// **'Crops (plants)'**
  String get statCropsPlants;

  /// No description provided for @statDailyMilk.
  ///
  /// In en, this message translates to:
  /// **'Daily milk production'**
  String get statDailyMilk;

  /// No description provided for @litresN.
  ///
  /// In en, this message translates to:
  /// **'{value} litres'**
  String litresN(String value);

  /// No description provided for @readyListsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One tap — also available as Excel'**
  String get readyListsSubtitle;

  /// No description provided for @rlElderly60.
  ///
  /// In en, this message translates to:
  /// **'Aged 60 and over'**
  String get rlElderly60;

  /// No description provided for @rlAlone70.
  ///
  /// In en, this message translates to:
  /// **'Aged 70+ living alone'**
  String get rlAlone70;

  /// No description provided for @rlUnder5.
  ///
  /// In en, this message translates to:
  /// **'Children aged 5 and under'**
  String get rlUnder5;

  /// No description provided for @rlSchool.
  ///
  /// In en, this message translates to:
  /// **'Schoolchildren'**
  String get rlSchool;

  /// No description provided for @rlDisabled.
  ///
  /// In en, this message translates to:
  /// **'Persons with disabilities'**
  String get rlDisabled;

  /// No description provided for @rlAway.
  ///
  /// In en, this message translates to:
  /// **'Abroad / temporarily away'**
  String get rlAway;

  /// No description provided for @rlWelfare.
  ///
  /// In en, this message translates to:
  /// **'Families receiving welfare benefits'**
  String get rlWelfare;

  /// No description provided for @rlTempHouses.
  ///
  /// In en, this message translates to:
  /// **'Temporary / semi-permanent houses'**
  String get rlTempHouses;

  /// No description provided for @rlNoToilet.
  ///
  /// In en, this message translates to:
  /// **'Houses without a toilet'**
  String get rlNoToilet;

  /// No description provided for @rlNoPower.
  ///
  /// In en, this message translates to:
  /// **'Houses without electricity'**
  String get rlNoPower;

  /// No description provided for @rlUnsafeWater.
  ///
  /// In en, this message translates to:
  /// **'Houses without safe water'**
  String get rlUnsafeWater;

  /// No description provided for @rlStateLand.
  ///
  /// In en, this message translates to:
  /// **'Families on state / encroached land'**
  String get rlStateLand;

  /// No description provided for @rlMilk.
  ///
  /// In en, this message translates to:
  /// **'Families / lands with dairy animals'**
  String get rlMilk;

  /// No description provided for @rlDogs.
  ///
  /// In en, this message translates to:
  /// **'Unvaccinated dogs'**
  String get rlDogs;

  /// No description provided for @rlTimber.
  ///
  /// In en, this message translates to:
  /// **'Lands with timber / valuable trees'**
  String get rlTimber;

  /// No description provided for @rlHazardTrees.
  ///
  /// In en, this message translates to:
  /// **'Hazardous trees'**
  String get rlHazardTrees;

  /// No description provided for @gradeN.
  ///
  /// In en, this message translates to:
  /// **'Grade {grade}'**
  String gradeN(String grade);

  /// No description provided for @familyOf.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s family'**
  String familyOf(String name);

  /// No description provided for @familyNoHead.
  ///
  /// In en, this message translates to:
  /// **'Family (no head)'**
  String get familyNoHead;

  /// No description provided for @milkPerDay.
  ///
  /// In en, this message translates to:
  /// **'{value} L a day'**
  String milkPerDay(String value);

  /// No description provided for @dogsN.
  ///
  /// In en, this message translates to:
  /// **'Dogs: {count}'**
  String dogsN(int count);

  /// No description provided for @metresN.
  ///
  /// In en, this message translates to:
  /// **'{value} m'**
  String metresN(int value);

  /// No description provided for @lastVerifiedYear.
  ///
  /// In en, this message translates to:
  /// **'Last verified {year}'**
  String lastVerifiedYear(String year);

  /// No description provided for @qSameNic.
  ///
  /// In en, this message translates to:
  /// **'Same NIC number for several people'**
  String get qSameNic;

  /// No description provided for @qInvalidNic.
  ///
  /// In en, this message translates to:
  /// **'Invalid NIC numbers'**
  String get qInvalidNic;

  /// No description provided for @qNoDob.
  ///
  /// In en, this message translates to:
  /// **'People without a date of birth'**
  String get qNoDob;

  /// No description provided for @qNoGps.
  ///
  /// In en, this message translates to:
  /// **'Lands without GPS'**
  String get qNoGps;

  /// No description provided for @qPoorGps.
  ///
  /// In en, this message translates to:
  /// **'Lands with poor GPS accuracy (10 m+)'**
  String get qPoorGps;

  /// No description provided for @qNoHousePhoto.
  ///
  /// In en, this message translates to:
  /// **'Houses without photos'**
  String get qNoHousePhoto;

  /// No description provided for @qDraft.
  ///
  /// In en, this message translates to:
  /// **'Lands still in draft'**
  String get qDraft;

  /// No description provided for @qStale.
  ///
  /// In en, this message translates to:
  /// **'Lands not re-verified for over a year'**
  String get qStale;

  /// No description provided for @ckGps.
  ///
  /// In en, this message translates to:
  /// **'GPS location'**
  String get ckGps;

  /// No description provided for @ckExtent.
  ///
  /// In en, this message translates to:
  /// **'Land extent'**
  String get ckExtent;

  /// No description provided for @ckOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get ckOwner;

  /// No description provided for @ckOwnerHint.
  ///
  /// In en, this message translates to:
  /// **'Add the owner from the \"{tab}\" tab'**
  String ckOwnerHint(String tab);

  /// No description provided for @ckNoneHintBuildings.
  ///
  /// In en, this message translates to:
  /// **'If there are no buildings, tick \"none\"'**
  String get ckNoneHintBuildings;

  /// No description provided for @ckHousePhotos.
  ///
  /// In en, this message translates to:
  /// **'House photos'**
  String get ckHousePhotos;

  /// No description provided for @ckHouseFamilies.
  ///
  /// In en, this message translates to:
  /// **'Families in houses'**
  String get ckHouseFamilies;

  /// No description provided for @ckHouseFamiliesHint.
  ///
  /// In en, this message translates to:
  /// **'If a house is empty, set its use to \"{vacant}\"'**
  String ckHouseFamiliesHint(String vacant);

  /// No description provided for @ckMembers.
  ///
  /// In en, this message translates to:
  /// **'Family members'**
  String get ckMembers;

  /// No description provided for @ckNoneHintTrees.
  ///
  /// In en, this message translates to:
  /// **'If there are no trees, tick \"none\"'**
  String get ckNoneHintTrees;

  /// No description provided for @ckNoneHintAnimals.
  ///
  /// In en, this message translates to:
  /// **'If there are no animals, tick \"none\"'**
  String get ckNoneHintAnimals;

  /// No description provided for @wGpsAccuracy.
  ///
  /// In en, this message translates to:
  /// **'GPS accuracy {metres} m — better to capture again'**
  String wGpsAccuracy(int metres);

  /// No description provided for @wTooManyTrees.
  ///
  /// In en, this message translates to:
  /// **'{count} trees on a {extent} land — check the extent or the count'**
  String wTooManyTrees(String extent, int count);

  /// No description provided for @wNoHead.
  ///
  /// In en, this message translates to:
  /// **'A family has no head selected'**
  String get wNoHead;

  /// No description provided for @wManyHeads.
  ///
  /// In en, this message translates to:
  /// **'One family has {count} heads'**
  String wManyHeads(int count);

  /// No description provided for @wOlderThanHead.
  ///
  /// In en, this message translates to:
  /// **'{name} is older than the head — check the relationship'**
  String wOlderThanHead(String name);

  /// No description provided for @wNoDob.
  ///
  /// In en, this message translates to:
  /// **'{name} — no date of birth'**
  String wNoDob(String name);

  /// No description provided for @wNoNic.
  ///
  /// In en, this message translates to:
  /// **'{name} — no NIC number (age {age})'**
  String wNoNic(String name, int age);

  /// No description provided for @wInvalidNic.
  ///
  /// In en, this message translates to:
  /// **'{name} — invalid NIC number'**
  String wInvalidNic(String name);

  /// No description provided for @wDobNicMismatch.
  ///
  /// In en, this message translates to:
  /// **'{name} — date of birth doesn\'t match the NIC'**
  String wDobNicMismatch(String name);

  /// No description provided for @wSameNic.
  ///
  /// In en, this message translates to:
  /// **'{first} and {second} — same NIC number'**
  String wSameNic(String first, String second);

  /// No description provided for @nicEmpty.
  ///
  /// In en, this message translates to:
  /// **'The NIC number is empty'**
  String get nicEmpty;

  /// No description provided for @nicBadFormat.
  ///
  /// In en, this message translates to:
  /// **'Wrong format — must be 9 digits + V/X, or 12 digits'**
  String get nicBadFormat;

  /// No description provided for @nicBadDay.
  ///
  /// In en, this message translates to:
  /// **'Invalid birth-day number'**
  String get nicBadDay;

  /// No description provided for @nicFeb29.
  ///
  /// In en, this message translates to:
  /// **'February 29 — not a leap year'**
  String get nicFeb29;

  /// No description provided for @nicFuture.
  ///
  /// In en, this message translates to:
  /// **'Date of birth is in the future'**
  String get nicFuture;

  /// No description provided for @nicBadYear.
  ///
  /// In en, this message translates to:
  /// **'Invalid birth year'**
  String get nicBadYear;

  /// Acres part of an A-R-P extent
  ///
  /// In en, this message translates to:
  /// **'A {value}'**
  String extentAcres(String value);

  /// Roods part of an A-R-P extent
  ///
  /// In en, this message translates to:
  /// **'R {value}'**
  String extentRoods(String value);

  /// Perches part of an A-R-P extent
  ///
  /// In en, this message translates to:
  /// **'P {value}'**
  String extentPerches(String value);

  /// No description provided for @extentHectares.
  ///
  /// In en, this message translates to:
  /// **'{value} ha'**
  String extentHectares(String value);

  /// Acres-roods-perches input mode
  ///
  /// In en, this message translates to:
  /// **'A-R-P'**
  String get unitArp;

  /// No description provided for @unitAcres.
  ///
  /// In en, this message translates to:
  /// **'Acres'**
  String get unitAcres;

  /// No description provided for @unitRoods.
  ///
  /// In en, this message translates to:
  /// **'Roods'**
  String get unitRoods;

  /// No description provided for @unitPerches.
  ///
  /// In en, this message translates to:
  /// **'Perches'**
  String get unitPerches;

  /// No description provided for @unitHectares.
  ///
  /// In en, this message translates to:
  /// **'Hectares'**
  String get unitHectares;

  /// No description provided for @fVillage.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get fVillage;

  /// No description provided for @fHouseGroup.
  ///
  /// In en, this message translates to:
  /// **'House group'**
  String get fHouseGroup;

  /// No description provided for @fLandName.
  ///
  /// In en, this message translates to:
  /// **'Land name'**
  String get fLandName;

  /// No description provided for @fAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get fAddress;

  /// No description provided for @fExtentPerches.
  ///
  /// In en, this message translates to:
  /// **'Extent (perches)'**
  String get fExtentPerches;

  /// No description provided for @fExtent.
  ///
  /// In en, this message translates to:
  /// **'Extent'**
  String get fExtent;

  /// No description provided for @fOwnership.
  ///
  /// In en, this message translates to:
  /// **'Ownership'**
  String get fOwnership;

  /// No description provided for @fOwners.
  ///
  /// In en, this message translates to:
  /// **'Owners'**
  String get fOwners;

  /// No description provided for @fDeedNo.
  ///
  /// In en, this message translates to:
  /// **'Deed no.'**
  String get fDeedNo;

  /// No description provided for @fDeedPermitNo.
  ///
  /// In en, this message translates to:
  /// **'Deed / permit no.'**
  String get fDeedPermitNo;

  /// No description provided for @fPlanNo.
  ///
  /// In en, this message translates to:
  /// **'Plan no.'**
  String get fPlanNo;

  /// No description provided for @fLotNo.
  ///
  /// In en, this message translates to:
  /// **'Lot no.'**
  String get fLotNo;

  /// No description provided for @fPlanLotNo.
  ///
  /// In en, this message translates to:
  /// **'Plan / lot no.'**
  String get fPlanLotNo;

  /// No description provided for @fScheme.
  ///
  /// In en, this message translates to:
  /// **'Settlement scheme'**
  String get fScheme;

  /// No description provided for @fUse.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get fUse;

  /// No description provided for @fSubdivision.
  ///
  /// In en, this message translates to:
  /// **'Subdivision'**
  String get fSubdivision;

  /// No description provided for @fNorth.
  ///
  /// In en, this message translates to:
  /// **'North'**
  String get fNorth;

  /// No description provided for @fEast.
  ///
  /// In en, this message translates to:
  /// **'East'**
  String get fEast;

  /// No description provided for @fSouth.
  ///
  /// In en, this message translates to:
  /// **'South'**
  String get fSouth;

  /// No description provided for @fWest.
  ///
  /// In en, this message translates to:
  /// **'West'**
  String get fWest;

  /// No description provided for @fDispute.
  ///
  /// In en, this message translates to:
  /// **'Dispute'**
  String get fDispute;

  /// No description provided for @fLatitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get fLatitude;

  /// No description provided for @fLongitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get fLongitude;

  /// No description provided for @fGpsAccuracyM.
  ///
  /// In en, this message translates to:
  /// **'GPS accuracy (m)'**
  String get fGpsAccuracyM;

  /// No description provided for @fStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get fStatus;

  /// No description provided for @fVerifiedOn.
  ///
  /// In en, this message translates to:
  /// **'Verified on'**
  String get fVerifiedOn;

  /// No description provided for @fVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get fVerified;

  /// No description provided for @fType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get fType;

  /// No description provided for @fNumber.
  ///
  /// In en, this message translates to:
  /// **'No.'**
  String get fNumber;

  /// No description provided for @fFloors.
  ///
  /// In en, this message translates to:
  /// **'Floors'**
  String get fFloors;

  /// No description provided for @fSqft.
  ///
  /// In en, this message translates to:
  /// **'Sq. ft'**
  String get fSqft;

  /// No description provided for @fRooms.
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get fRooms;

  /// No description provided for @fYearBuilt.
  ///
  /// In en, this message translates to:
  /// **'Year built'**
  String get fYearBuilt;

  /// No description provided for @fWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get fWater;

  /// No description provided for @fApproval.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get fApproval;

  /// No description provided for @fHead.
  ///
  /// In en, this message translates to:
  /// **'Head'**
  String get fHead;

  /// No description provided for @fMembers.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get fMembers;

  /// No description provided for @fIncomeSource.
  ///
  /// In en, this message translates to:
  /// **'Income source'**
  String get fIncomeSource;

  /// No description provided for @fFuel.
  ///
  /// In en, this message translates to:
  /// **'Fuel'**
  String get fFuel;

  /// No description provided for @fWelfare.
  ///
  /// In en, this message translates to:
  /// **'Welfare'**
  String get fWelfare;

  /// No description provided for @fSinceYear.
  ///
  /// In en, this message translates to:
  /// **'Resident since'**
  String get fSinceYear;

  /// No description provided for @fFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fFullName;

  /// No description provided for @fNameWithInitials.
  ///
  /// In en, this message translates to:
  /// **'Name with initials'**
  String get fNameWithInitials;

  /// No description provided for @fNic.
  ///
  /// In en, this message translates to:
  /// **'NIC'**
  String get fNic;

  /// No description provided for @fDob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get fDob;

  /// No description provided for @fAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get fAge;

  /// No description provided for @fSex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get fSex;

  /// No description provided for @fRelation.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get fRelation;

  /// No description provided for @fGrade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get fGrade;

  /// No description provided for @fWorkplace.
  ///
  /// In en, this message translates to:
  /// **'Workplace'**
  String get fWorkplace;

  /// No description provided for @fVoter.
  ///
  /// In en, this message translates to:
  /// **'Voter'**
  String get fVoter;

  /// No description provided for @fIllnesses.
  ///
  /// In en, this message translates to:
  /// **'Illnesses'**
  String get fIllnesses;

  /// No description provided for @fBearing.
  ///
  /// In en, this message translates to:
  /// **'Bearing'**
  String get fBearing;

  /// No description provided for @fYoungTrees.
  ///
  /// In en, this message translates to:
  /// **'Young'**
  String get fYoungTrees;

  /// No description provided for @fTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get fTotal;

  /// No description provided for @fGirthIn.
  ///
  /// In en, this message translates to:
  /// **'Girth (in)'**
  String get fGirthIn;

  /// No description provided for @fHeightFt.
  ///
  /// In en, this message translates to:
  /// **'Height (ft)'**
  String get fHeightFt;

  /// No description provided for @fHazardous.
  ///
  /// In en, this message translates to:
  /// **'Hazardous'**
  String get fHazardous;

  /// No description provided for @fCrop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get fCrop;

  /// No description provided for @fAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get fAmount;

  /// No description provided for @fMaleAnimals.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get fMaleAnimals;

  /// No description provided for @fFemaleAnimals.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get fFemaleAnimals;

  /// No description provided for @fYoungAnimals.
  ///
  /// In en, this message translates to:
  /// **'Young'**
  String get fYoungAnimals;

  /// No description provided for @fMilkPerDay.
  ///
  /// In en, this message translates to:
  /// **'Milk (L/day)'**
  String get fMilkPerDay;

  /// No description provided for @fVaccinated.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated'**
  String get fVaccinated;

  /// No description provided for @fLastVaccination.
  ///
  /// In en, this message translates to:
  /// **'Last vaccination'**
  String get fLastVaccination;

  /// No description provided for @fDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get fDetails;

  /// No description provided for @sheetPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get sheetPeople;

  /// No description provided for @sheetTreesCounted.
  ///
  /// In en, this message translates to:
  /// **'Trees (counted)'**
  String get sheetTreesCounted;

  /// No description provided for @sheetList.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get sheetList;

  /// No description provided for @landNew.
  ///
  /// In en, this message translates to:
  /// **'New land'**
  String get landNew;

  /// No description provided for @landEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit land'**
  String get landEdit;

  /// No description provided for @landNameRequired.
  ///
  /// In en, this message translates to:
  /// **'The land name is required'**
  String get landNameRequired;

  /// No description provided for @selectHouseGroup.
  ///
  /// In en, this message translates to:
  /// **'Select a house group'**
  String get selectHouseGroup;

  /// No description provided for @extentInvalid.
  ///
  /// In en, this message translates to:
  /// **'The land extent is not valid'**
  String get extentInvalid;

  /// No description provided for @arpOddConfirm.
  ///
  /// In en, this message translates to:
  /// **'A value is 4 roods or 40 perches or more. Save the total extent as {extent}?'**
  String arpOddConfirm(String extent);

  /// No description provided for @deedDupConfirm.
  ///
  /// In en, this message translates to:
  /// **'Deed number \"{deed}\" is already recorded for the land \"{land}\". Save anyway?'**
  String deedDupConfirm(String deed, String land);

  /// No description provided for @villageGroupField.
  ///
  /// In en, this message translates to:
  /// **'Village / house group *'**
  String get villageGroupField;

  /// No description provided for @landNameField.
  ///
  /// In en, this message translates to:
  /// **'Land name *'**
  String get landNameField;

  /// No description provided for @landNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Koswatta'**
  String get landNameHint;

  /// No description provided for @addressField.
  ///
  /// In en, this message translates to:
  /// **'Address / location description'**
  String get addressField;

  /// No description provided for @subdivisionAllowed.
  ///
  /// In en, this message translates to:
  /// **'Subdivision allowed'**
  String get subdivisionAllowed;

  /// No description provided for @ownersAddLater.
  ///
  /// In en, this message translates to:
  /// **'After saving the land, add owners and occupants in the \"{section}\" section.'**
  String ownersAddLater(String section);

  /// No description provided for @boundaries.
  ///
  /// In en, this message translates to:
  /// **'Boundaries'**
  String get boundaries;

  /// No description provided for @hasDispute.
  ///
  /// In en, this message translates to:
  /// **'There is a dispute'**
  String get hasDispute;

  /// No description provided for @disputeNote.
  ///
  /// In en, this message translates to:
  /// **'Dispute details'**
  String get disputeNote;

  /// No description provided for @otherNotes.
  ///
  /// In en, this message translates to:
  /// **'Other notes'**
  String get otherNotes;

  /// No description provided for @disputeExists.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get disputeExists;

  /// No description provided for @gpsNotTaken.
  ///
  /// In en, this message translates to:
  /// **'GPS location not captured'**
  String get gpsNotTaken;

  /// No description provided for @gpsAccuracyPoor.
  ///
  /// In en, this message translates to:
  /// **'Accuracy {metres} m — poor, capture again'**
  String gpsAccuracyPoor(int metres);

  /// No description provided for @gpsAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy {metres} m'**
  String gpsAccuracy(int metres);

  /// No description provided for @gpsRetake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get gpsRetake;

  /// No description provided for @gpsTake.
  ///
  /// In en, this message translates to:
  /// **'Get GPS'**
  String get gpsTake;

  /// No description provided for @gpsServiceOff.
  ///
  /// In en, this message translates to:
  /// **'Turn on the phone\'s Location (GPS)'**
  String get gpsServiceOff;

  /// No description provided for @gpsDenied.
  ///
  /// In en, this message translates to:
  /// **'No permission to get the location — allow it in Settings'**
  String get gpsDenied;

  /// No description provided for @gpsFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get GPS — go into the open and try again'**
  String get gpsFailed;

  /// No description provided for @photoFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t take the photo: {error}'**
  String photoFailed(String error);

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @photoDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this photo?'**
  String get photoDeleteConfirm;

  /// No description provided for @newItem.
  ///
  /// In en, this message translates to:
  /// **'New item'**
  String get newItem;

  /// No description provided for @addNewItem.
  ///
  /// In en, this message translates to:
  /// **'Add a new item'**
  String get addNewItem;

  /// No description provided for @pickLists.
  ///
  /// In en, this message translates to:
  /// **'Pick lists'**
  String get pickLists;

  /// No description provided for @pickListsSub.
  ///
  /// In en, this message translates to:
  /// **'Add types of trees, animals, crops and more'**
  String get pickListsSub;

  /// No description provided for @itemsN.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String itemsN(int count);

  /// No description provided for @addedByYou.
  ///
  /// In en, this message translates to:
  /// **'Added by you'**
  String get addedByYou;

  /// No description provided for @shown.
  ///
  /// In en, this message translates to:
  /// **'Shown'**
  String get shown;

  /// No description provided for @hidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get hidden;

  /// No description provided for @customItemsNote.
  ///
  /// In en, this message translates to:
  /// **'Items you add show with the same name in every language.'**
  String get customItemsNote;

  /// No description provided for @landNotFound.
  ///
  /// In en, this message translates to:
  /// **'Land not found'**
  String get landNotFound;

  /// No description provided for @landRemoved.
  ///
  /// In en, this message translates to:
  /// **'This land has been removed'**
  String get landRemoved;

  /// No description provided for @stepByStep.
  ///
  /// In en, this message translates to:
  /// **'Step by step'**
  String get stepByStep;

  /// No description provided for @landDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this land and all its buildings, families, trees and animals?\n(Only if it was entered by mistake. It stays in the history.)'**
  String get landDeleteConfirm;

  /// No description provided for @landDelete.
  ///
  /// In en, this message translates to:
  /// **'Remove land'**
  String get landDelete;

  /// No description provided for @percentComplete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% complete'**
  String percentComplete(int percent);

  /// No description provided for @forCompleteness.
  ///
  /// In en, this message translates to:
  /// **'For completeness'**
  String get forCompleteness;

  /// No description provided for @onThisLand.
  ///
  /// In en, this message translates to:
  /// **'On this land'**
  String get onThisLand;

  /// No description provided for @completeness.
  ///
  /// In en, this message translates to:
  /// **'Information completeness'**
  String get completeness;

  /// No description provided for @allSectionsComplete.
  ///
  /// In en, this message translates to:
  /// **'All sections complete 🎉'**
  String get allSectionsComplete;

  /// No description provided for @sectionsDone.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} sections complete.\nRemaining: {missing}'**
  String sectionsDone(int done, int total, String missing);

  /// No description provided for @nicDupElsewhere.
  ///
  /// In en, this message translates to:
  /// **'{nic} — also recorded elsewhere as {name} (duplicate?)'**
  String nicDupElsewhere(String nic, String name);

  /// No description provided for @pleaseCheckN.
  ///
  /// In en, this message translates to:
  /// **'Please check ({count})'**
  String pleaseCheckN(int count);

  /// No description provided for @markCompleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 section is} other{{count} sections are}} still incomplete. Mark as \"{status}\"?'**
  String markCompleteConfirm(int count, String status);

  /// Button that marks a land as complete
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get markComplete;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @backToDraft.
  ///
  /// In en, this message translates to:
  /// **'Back to draft'**
  String get backToDraft;

  /// No description provided for @landDetails.
  ///
  /// In en, this message translates to:
  /// **'Land details'**
  String get landDetails;

  /// No description provided for @noBuildingsOnLand.
  ///
  /// In en, this message translates to:
  /// **'No buildings on this land'**
  String get noBuildingsOnLand;

  /// No description provided for @roomsN.
  ///
  /// In en, this message translates to:
  /// **'Rooms {count}'**
  String roomsN(int count);

  /// No description provided for @familiesN.
  ///
  /// In en, this message translates to:
  /// **'Families {count}'**
  String familiesN(int count);

  /// No description provided for @noPhotosWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠ No photos'**
  String get noPhotosWarning;

  /// No description provided for @addHouseFirstConfirm.
  ///
  /// In en, this message translates to:
  /// **'To add a family, first add a house. Add a house now?'**
  String get addHouseFirstConfirm;

  /// No description provided for @landParties.
  ///
  /// In en, this message translates to:
  /// **'People linked to the land'**
  String get landParties;

  /// No description provided for @landPartiesHint.
  ///
  /// In en, this message translates to:
  /// **'Add owners, occupants, heirs and others here.'**
  String get landPartiesHint;

  /// No description provided for @shareN.
  ///
  /// In en, this message translates to:
  /// **'Share {share}'**
  String shareN(String share);

  /// No description provided for @outsideDivision.
  ///
  /// In en, this message translates to:
  /// **'Outside the division'**
  String get outsideDivision;

  /// Short button label with a + icon
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get addFamilyButton;

  /// No description provided for @addMember.
  ///
  /// In en, this message translates to:
  /// **'Add a member'**
  String get addMember;

  /// No description provided for @noFamiliesYet.
  ///
  /// In en, this message translates to:
  /// **'No families added yet. Tap the \"{button}\" button.'**
  String noFamiliesYet(String button);

  /// No description provided for @countAction.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get countAction;

  /// No description provided for @bearingYoung.
  ///
  /// In en, this message translates to:
  /// **'Bearing {bearing} • Young {young}'**
  String bearingYoung(int bearing, int young);

  /// No description provided for @singleTree.
  ///
  /// In en, this message translates to:
  /// **'Single tree'**
  String get singleTree;

  /// No description provided for @girthInN.
  ///
  /// In en, this message translates to:
  /// **'Girth {value} in'**
  String girthInN(String value);

  /// No description provided for @heightFtN.
  ///
  /// In en, this message translates to:
  /// **'Height {value} ft'**
  String heightFtN(String value);

  /// No description provided for @hazardWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠ Hazardous'**
  String get hazardWarning;

  /// Short button label with a + icon
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get addCropButton;

  /// No description provided for @noTreesOnLand.
  ///
  /// In en, this message translates to:
  /// **'No trees / crops on this land'**
  String get noTreesOnLand;

  /// No description provided for @animalCountsShort.
  ///
  /// In en, this message translates to:
  /// **'M {male} • F {female} • Y {young}'**
  String animalCountsShort(int male, int female, int young);

  /// No description provided for @milkLitresPerDay.
  ///
  /// In en, this message translates to:
  /// **'Milk {value} L/day'**
  String milkLitresPerDay(String value);

  /// No description provided for @vaccinatedValue.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated: {value}'**
  String vaccinatedValue(String value);

  /// No description provided for @noAnimalsOnLand.
  ///
  /// In en, this message translates to:
  /// **'No animals on this land'**
  String get noAnimalsOnLand;

  /// No description provided for @landPhotos.
  ///
  /// In en, this message translates to:
  /// **'Land photos'**
  String get landPhotos;

  /// No description provided for @otherPhotos.
  ///
  /// In en, this message translates to:
  /// **'Building / tree photos'**
  String get otherPhotos;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No history'**
  String get noHistory;

  /// No description provided for @entLandParty.
  ///
  /// In en, this message translates to:
  /// **'Person linked to land'**
  String get entLandParty;

  /// No description provided for @entBuilding.
  ///
  /// In en, this message translates to:
  /// **'Building'**
  String get entBuilding;

  /// No description provided for @entResidenceEvent.
  ///
  /// In en, this message translates to:
  /// **'Residence change'**
  String get entResidenceEvent;

  /// No description provided for @entTree.
  ///
  /// In en, this message translates to:
  /// **'Single tree'**
  String get entTree;

  /// No description provided for @entCrop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get entCrop;

  /// No description provided for @entPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get entPhoto;

  /// No description provided for @actCreate.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get actCreate;

  /// No description provided for @actUpdate.
  ///
  /// In en, this message translates to:
  /// **'Changed'**
  String get actUpdate;

  /// No description provided for @actDelete.
  ///
  /// In en, this message translates to:
  /// **'Removed'**
  String get actDelete;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {total} — {name}'**
  String stepOf(int step, int total, String name);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @nextStep.
  ///
  /// In en, this message translates to:
  /// **'Next: {name}'**
  String nextStep(String name);

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @nextPlace.
  ///
  /// In en, this message translates to:
  /// **'Next place'**
  String get nextPlace;

  /// No description provided for @evArrived.
  ///
  /// In en, this message translates to:
  /// **'Moved in'**
  String get evArrived;

  /// No description provided for @evLeft.
  ///
  /// In en, this message translates to:
  /// **'Moved out'**
  String get evLeft;

  /// No description provided for @evBirth.
  ///
  /// In en, this message translates to:
  /// **'Birth'**
  String get evBirth;

  /// No description provided for @evDeath.
  ///
  /// In en, this message translates to:
  /// **'Death'**
  String get evDeath;

  /// No description provided for @evAway.
  ///
  /// In en, this message translates to:
  /// **'Went away temporarily'**
  String get evAway;

  /// No description provided for @evReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get evReturned;

  /// No description provided for @nicDerived.
  ///
  /// In en, this message translates to:
  /// **'Date of birth {dob} • {sex} — from the NIC'**
  String nicDerived(String dob, String sex);

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'The name is required'**
  String get nameRequired;

  /// No description provided for @nicInvalidConfirm.
  ///
  /// In en, this message translates to:
  /// **'The NIC number is not valid ({error}). Save anyway?'**
  String nicInvalidConfirm(String error);

  /// No description provided for @dobMismatchConfirm.
  ///
  /// In en, this message translates to:
  /// **'The date of birth entered doesn\'t match the NIC. Save anyway?'**
  String get dobMismatchConfirm;

  /// No description provided for @nicDupConfirm.
  ///
  /// In en, this message translates to:
  /// **'This NIC number is already in the register: {names}\n\nCheck whether the same person has been entered twice. Save anyway?'**
  String nicDupConfirm(String names);

  /// No description provided for @nicLaterNote.
  ///
  /// In en, this message translates to:
  /// **'Note: age {age} — add the NIC number later'**
  String nicLaterNote(int age);

  /// No description provided for @twoHeadsConfirm.
  ///
  /// In en, this message translates to:
  /// **'{name} is already the head. The family would have two heads. Save anyway?'**
  String twoHeadsConfirm(String name);

  /// No description provided for @olderThanHeadConfirm.
  ///
  /// In en, this message translates to:
  /// **'This person is older than the head ({name}). Is the relationship correct?'**
  String olderThanHeadConfirm(String name);

  /// No description provided for @newMember.
  ///
  /// In en, this message translates to:
  /// **'New member'**
  String get newMember;

  /// No description provided for @removeIfMistake.
  ///
  /// In en, this message translates to:
  /// **'Remove if entered by mistake'**
  String get removeIfMistake;

  /// No description provided for @personDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Only remove if entered by mistake.\nIf the person moved away or died, change \"{field}\" instead.\n\nRemove?'**
  String personDeleteConfirm(String field);

  /// No description provided for @fullNameField.
  ///
  /// In en, this message translates to:
  /// **'Full name *'**
  String get fullNameField;

  /// No description provided for @nicField.
  ///
  /// In en, this message translates to:
  /// **'National Identity Card number'**
  String get nicField;

  /// No description provided for @eduAndWork.
  ///
  /// In en, this message translates to:
  /// **'Education & employment'**
  String get eduAndWork;

  /// No description provided for @gradeSchoolField.
  ///
  /// In en, this message translates to:
  /// **'Grade / school'**
  String get gradeSchoolField;

  /// No description provided for @healthOther.
  ///
  /// In en, this message translates to:
  /// **'Health & other'**
  String get healthOther;

  /// No description provided for @chronicIllnessField.
  ///
  /// In en, this message translates to:
  /// **'Chronic illnesses (optional)'**
  String get chronicIllnessField;

  /// No description provided for @isVoterField.
  ///
  /// In en, this message translates to:
  /// **'Registered voter?'**
  String get isVoterField;

  /// No description provided for @statusChangedOn.
  ///
  /// In en, this message translates to:
  /// **'Date of change: {date}'**
  String statusChangedOn(String date);

  /// No description provided for @nameOrNicHint.
  ///
  /// In en, this message translates to:
  /// **'Name or NIC number'**
  String get nameOrNicHint;

  /// No description provided for @pickFromRegister.
  ///
  /// In en, this message translates to:
  /// **'Choose from the register'**
  String get pickFromRegister;

  /// No description provided for @pickFromRegisterSub.
  ///
  /// In en, this message translates to:
  /// **'If they live in the division'**
  String get pickFromRegisterSub;

  /// No description provided for @outsideNameField.
  ///
  /// In en, this message translates to:
  /// **'Or name (if they live outside the division)'**
  String get outsideNameField;

  /// No description provided for @shareField.
  ///
  /// In en, this message translates to:
  /// **'Share (optional)'**
  String get shareField;

  /// No description provided for @shareHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1/2'**
  String get shareHint;

  /// No description provided for @pickPersonOrName.
  ///
  /// In en, this message translates to:
  /// **'Choose a person or enter a name'**
  String get pickPersonOrName;

  /// No description provided for @nicCard.
  ///
  /// In en, this message translates to:
  /// **'National Identity Card'**
  String get nicCard;

  /// No description provided for @nicInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'⚠ Invalid number'**
  String get nicInvalidNumber;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal details'**
  String get personalDetails;

  /// No description provided for @livesAt.
  ///
  /// In en, this message translates to:
  /// **'Lives at'**
  String get livesAt;

  /// No description provided for @otherFamilyMembers.
  ///
  /// In en, this message translates to:
  /// **'Other family members'**
  String get otherFamilyMembers;

  /// No description provided for @linkedLands.
  ///
  /// In en, this message translates to:
  /// **'Linked lands'**
  String get linkedLands;

  /// No description provided for @residenceHistory.
  ///
  /// In en, this message translates to:
  /// **'Residence history'**
  String get residenceHistory;

  /// No description provided for @selectBuildingType.
  ///
  /// In en, this message translates to:
  /// **'Select the building type'**
  String get selectBuildingType;

  /// No description provided for @yearBuiltInvalid.
  ///
  /// In en, this message translates to:
  /// **'The year built is not valid'**
  String get yearBuiltInvalid;

  /// No description provided for @newBuilding.
  ///
  /// In en, this message translates to:
  /// **'New building'**
  String get newBuilding;

  /// No description provided for @buildingDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this building and the families living in it? (It stays in the history)'**
  String get buildingDeleteConfirm;

  /// No description provided for @buildingNoField.
  ///
  /// In en, this message translates to:
  /// **'House / building no.'**
  String get buildingNoField;

  /// No description provided for @buildingNoHint.
  ///
  /// In en, this message translates to:
  /// **'Pradeshiya Sabha number, if any'**
  String get buildingNoHint;

  /// No description provided for @floorsField.
  ///
  /// In en, this message translates to:
  /// **'Number of floors'**
  String get floorsField;

  /// No description provided for @floorAreaField.
  ///
  /// In en, this message translates to:
  /// **'Floor area (sq. ft)'**
  String get floorAreaField;

  /// No description provided for @roomsField.
  ///
  /// In en, this message translates to:
  /// **'Number of rooms'**
  String get roomsField;

  /// No description provided for @materials.
  ///
  /// In en, this message translates to:
  /// **'Construction materials'**
  String get materials;

  /// No description provided for @yearBuiltField.
  ///
  /// In en, this message translates to:
  /// **'Year built (approx.)'**
  String get yearBuiltField;

  /// No description provided for @facilities.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get facilities;

  /// No description provided for @buildingApproval.
  ///
  /// In en, this message translates to:
  /// **'Building approval'**
  String get buildingApproval;

  /// No description provided for @housePhotoRequired.
  ///
  /// In en, this message translates to:
  /// **'A photo of the front of the house is required.'**
  String get housePhotoRequired;

  /// No description provided for @selectFamilyHouse.
  ///
  /// In en, this message translates to:
  /// **'Select the house the family lives in'**
  String get selectFamilyHouse;

  /// No description provided for @sinceYearInvalid.
  ///
  /// In en, this message translates to:
  /// **'The year they moved in is not valid'**
  String get sinceYearInvalid;

  /// No description provided for @newFamily.
  ///
  /// In en, this message translates to:
  /// **'New family'**
  String get newFamily;

  /// No description provided for @familyDetails.
  ///
  /// In en, this message translates to:
  /// **'Family details'**
  String get familyDetails;

  /// No description provided for @familyDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this family and its members? (It stays in the history)'**
  String get familyDeleteConfirm;

  /// No description provided for @livingBuildingField.
  ///
  /// In en, this message translates to:
  /// **'Building they live in *'**
  String get livingBuildingField;

  /// No description provided for @sinceYearField.
  ///
  /// In en, this message translates to:
  /// **'Year they moved in'**
  String get sinceYearField;

  /// No description provided for @treeCountTitle.
  ///
  /// In en, this message translates to:
  /// **'Tree count ({count})'**
  String treeCountTitle(int count);

  /// No description provided for @youngNotBearing.
  ///
  /// In en, this message translates to:
  /// **'Young / not bearing'**
  String get youngNotBearing;

  /// No description provided for @addSpecies.
  ///
  /// In en, this message translates to:
  /// **'Add a species'**
  String get addSpecies;

  /// No description provided for @otherSpecies.
  ///
  /// In en, this message translates to:
  /// **'Other species'**
  String get otherSpecies;

  /// No description provided for @timberHint.
  ///
  /// In en, this message translates to:
  /// **'Add valuable timber trees such as teak and mahogany separately as a \"{button}\", with the girth.'**
  String timberHint(String button);

  /// No description provided for @selectTreeSpecies.
  ///
  /// In en, this message translates to:
  /// **'Select the tree species'**
  String get selectTreeSpecies;

  /// No description provided for @girthInvalid.
  ///
  /// In en, this message translates to:
  /// **'The girth (inches) is not valid'**
  String get girthInvalid;

  /// No description provided for @treeDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this tree? (If it was cut down, also leave a note)'**
  String get treeDeleteConfirm;

  /// No description provided for @girthField.
  ///
  /// In en, this message translates to:
  /// **'Girth at breast height (inches)'**
  String get girthField;

  /// No description provided for @girthHint.
  ///
  /// In en, this message translates to:
  /// **'4½ ft above the ground'**
  String get girthHint;

  /// No description provided for @heightField.
  ///
  /// In en, this message translates to:
  /// **'Approx. height (ft)'**
  String get heightField;

  /// No description provided for @treeAgeField.
  ///
  /// In en, this message translates to:
  /// **'Approx. age (years)'**
  String get treeAgeField;

  /// No description provided for @hazardousField.
  ///
  /// In en, this message translates to:
  /// **'Hazardous'**
  String get hazardousField;

  /// No description provided for @hazardousHint.
  ///
  /// In en, this message translates to:
  /// **'Could fall on a house / power line'**
  String get hazardousHint;

  /// No description provided for @selectCrop.
  ///
  /// In en, this message translates to:
  /// **'Select the crop'**
  String get selectCrop;

  /// No description provided for @newCrop.
  ///
  /// In en, this message translates to:
  /// **'New crop'**
  String get newCrop;

  /// No description provided for @cropDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this crop?'**
  String get cropDeleteConfirm;

  /// No description provided for @selectAnimal.
  ///
  /// In en, this message translates to:
  /// **'Select the animal type'**
  String get selectAnimal;

  /// No description provided for @enterCount.
  ///
  /// In en, this message translates to:
  /// **'Enter the count'**
  String get enterCount;

  /// No description provided for @milkPerAnimalConfirm.
  ///
  /// In en, this message translates to:
  /// **'{litres} litres of milk per animal per day — is that correct?'**
  String milkPerAnimalConfirm(String litres);

  /// No description provided for @addAnimals.
  ///
  /// In en, this message translates to:
  /// **'Add animals'**
  String get addAnimals;

  /// No description provided for @recordDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this record?'**
  String get recordDeleteConfirm;

  /// No description provided for @dailyMilkField.
  ///
  /// In en, this message translates to:
  /// **'Daily milk (litres)'**
  String get dailyMilkField;

  /// No description provided for @rabiesVaccinated.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated against rabies?'**
  String get rabiesVaccinated;

  /// No description provided for @vaccinatedQuestion.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated?'**
  String get vaccinatedQuestion;

  /// No description provided for @lastVaccinationDate.
  ///
  /// In en, this message translates to:
  /// **'Last vaccination date'**
  String get lastVaccinationDate;

  /// No description provided for @lastVaccinationOn.
  ///
  /// In en, this message translates to:
  /// **'Last vaccination: {date}'**
  String lastVaccinationOn(String date);

  /// No description provided for @ownerFamily.
  ///
  /// In en, this message translates to:
  /// **'Owner family'**
  String get ownerFamily;

  /// No description provided for @villagesAndGroups.
  ///
  /// In en, this message translates to:
  /// **'Villages & house groups'**
  String get villagesAndGroups;

  /// Short button label with a + icon
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get addVillageButton;

  /// No description provided for @needOneGroup.
  ///
  /// In en, this message translates to:
  /// **'Add at least one village and one house group'**
  String get needOneGroup;

  /// No description provided for @structureEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add the villages in your division. Then add house groups (e.g. 1001/01) to each village.'**
  String get structureEmpty;

  /// No description provided for @supervisingValue.
  ///
  /// In en, this message translates to:
  /// **'Supervising officer: {name}'**
  String supervisingValue(String name);

  /// No description provided for @leaderValue.
  ///
  /// In en, this message translates to:
  /// **'Leader: {name}'**
  String leaderValue(String name);

  /// No description provided for @landsN.
  ///
  /// In en, this message translates to:
  /// **'Lands {count}'**
  String landsN(int count);

  /// No description provided for @addHouseGroup.
  ///
  /// In en, this message translates to:
  /// **'Add a house group'**
  String get addHouseGroup;

  /// No description provided for @newVillage.
  ///
  /// In en, this message translates to:
  /// **'New village'**
  String get newVillage;

  /// No description provided for @villageNameField.
  ///
  /// In en, this message translates to:
  /// **'Village name *'**
  String get villageNameField;

  /// No description provided for @supervisingOfficerField.
  ///
  /// In en, this message translates to:
  /// **'Supervising officer'**
  String get supervisingOfficerField;

  /// No description provided for @supervisingOfficerHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Samurdhi Development Officer'**
  String get supervisingOfficerHint;

  /// No description provided for @removeGroupsFirst.
  ///
  /// In en, this message translates to:
  /// **'Remove the house groups here first'**
  String get removeGroupsFirst;

  /// No description provided for @newHouseGroup.
  ///
  /// In en, this message translates to:
  /// **'New house group'**
  String get newHouseGroup;

  /// No description provided for @groupNoField.
  ///
  /// In en, this message translates to:
  /// **'Group number *'**
  String get groupNoField;

  /// No description provided for @groupNoHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1001/01'**
  String get groupNoHint;

  /// No description provided for @groupLeaderField.
  ///
  /// In en, this message translates to:
  /// **'Group leader'**
  String get groupLeaderField;

  /// No description provided for @leaderPhoneField.
  ///
  /// In en, this message translates to:
  /// **'Leader\'s phone'**
  String get leaderPhoneField;

  /// No description provided for @expectedLandsField.
  ///
  /// In en, this message translates to:
  /// **'Approx. number of lands / houses'**
  String get expectedLandsField;

  /// No description provided for @expectedLandsHint.
  ///
  /// In en, this message translates to:
  /// **'For survey progress'**
  String get expectedLandsHint;

  /// No description provided for @groupHasLands.
  ///
  /// In en, this message translates to:
  /// **'This group has {count, plural, =1{1 land} other{{count} lands}} — it cannot be removed'**
  String groupHasLands(int count);

  /// No description provided for @codeNameRequired.
  ///
  /// In en, this message translates to:
  /// **'The division number and name are required'**
  String get codeNameRequired;

  /// No description provided for @divisionDetails.
  ///
  /// In en, this message translates to:
  /// **'Division details'**
  String get divisionDetails;

  /// No description provided for @setupWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome! First, enter the details of your Grama Niladhari division.'**
  String get setupWelcome;

  /// No description provided for @divisionNoField.
  ///
  /// In en, this message translates to:
  /// **'Division number *'**
  String get divisionNoField;

  /// No description provided for @divisionNoHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 1001'**
  String get divisionNoHint;

  /// No description provided for @divisionNameField.
  ///
  /// In en, this message translates to:
  /// **'Division name *'**
  String get divisionNameField;

  /// No description provided for @divisionNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Haragama'**
  String get divisionNameHint;

  /// No description provided for @dsDivisionField.
  ///
  /// In en, this message translates to:
  /// **'Divisional Secretariat division'**
  String get dsDivisionField;

  /// No description provided for @dsDivisionHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Pathahewaheta'**
  String get dsDivisionHint;

  /// No description provided for @districtField.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get districtField;

  /// No description provided for @districtHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Kandy'**
  String get districtHint;

  /// No description provided for @gnNameField.
  ///
  /// In en, this message translates to:
  /// **'Grama Niladhari name'**
  String get gnNameField;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Division, language, appearance, security, backup'**
  String get settingsSubtitle;

  /// No description provided for @division.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get division;

  /// No description provided for @divisionDetailsSub.
  ///
  /// In en, this message translates to:
  /// **'Number, name, officer'**
  String get divisionDetailsSub;

  /// No description provided for @textSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get textSize;

  /// No description provided for @sizeNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get sizeNormal;

  /// No description provided for @sizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get sizeLarge;

  /// No description provided for @sizeXLarge.
  ///
  /// In en, this message translates to:
  /// **'Very large'**
  String get sizeXLarge;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @changePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get changePin;

  /// No description provided for @pinChanged.
  ///
  /// In en, this message translates to:
  /// **'PIN changed'**
  String get pinChanged;

  /// No description provided for @biometric.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint / face'**
  String get biometric;

  /// No description provided for @biometricSub.
  ///
  /// In en, this message translates to:
  /// **'Unlock without the PIN'**
  String get biometricSub;

  /// No description provided for @autoLock.
  ///
  /// In en, this message translates to:
  /// **'Auto-lock'**
  String get autoLock;

  /// No description provided for @lockImmediately.
  ///
  /// In en, this message translates to:
  /// **'Immediately'**
  String get lockImmediately;

  /// No description provided for @minutesN.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String minutesN(int count);

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @createBackup.
  ///
  /// In en, this message translates to:
  /// **'Create a backup'**
  String get createBackup;

  /// No description provided for @noBackupYet.
  ///
  /// In en, this message translates to:
  /// **'None yet — data will be lost if the phone is lost'**
  String get noBackupYet;

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last: {date}'**
  String lastBackup(String date);

  /// No description provided for @restoreFromBackup.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup'**
  String get restoreFromBackup;

  /// No description provided for @backupPassword.
  ///
  /// In en, this message translates to:
  /// **'Backup password'**
  String get backupPassword;

  /// No description provided for @backupPasswordWarning.
  ///
  /// In en, this message translates to:
  /// **'The backup can\'t be opened without this password. Keep it safe.'**
  String get backupPasswordWarning;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get passwordRepeat;

  /// No description provided for @passwordMin.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get passwordMin;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords don\'t match'**
  String get passwordMismatch;

  /// No description provided for @backupShareText.
  ///
  /// In en, this message translates to:
  /// **'SmartGrama encrypted backup'**
  String get backupShareText;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {error}'**
  String backupFailed(String error);

  /// No description provided for @restoreConfirm.
  ///
  /// In en, this message translates to:
  /// **'Restoring removes all current data and keeps only the data in the backup. Continue?'**
  String get restoreConfirm;

  /// No description provided for @restoreDone.
  ///
  /// In en, this message translates to:
  /// **'Restore successful'**
  String get restoreDone;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {error}'**
  String restoreFailed(String error);

  /// No description provided for @backupPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'The password must be at least 6 characters'**
  String get backupPasswordTooShort;

  /// No description provided for @backupWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password, or this is not a SmartGrama backup file'**
  String get backupWrongPassword;

  /// No description provided for @backupOtherVersion.
  ///
  /// In en, this message translates to:
  /// **'This backup was made with a different version ({version})'**
  String backupOtherVersion(int version);

  /// No description provided for @backupNotSmartGrama.
  ///
  /// In en, this message translates to:
  /// **'This is not a SmartGrama backup file'**
  String get backupNotSmartGrama;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer (debug)'**
  String get developer;

  /// No description provided for @addDemoData.
  ///
  /// In en, this message translates to:
  /// **'Add demo data'**
  String get addDemoData;

  /// No description provided for @testingOnly.
  ///
  /// In en, this message translates to:
  /// **'For testing only'**
  String get testingOnly;

  /// No description provided for @demoDataAdded.
  ///
  /// In en, this message translates to:
  /// **'Demo data added'**
  String get demoDataAdded;

  /// No description provided for @privacyNote.
  ///
  /// In en, this message translates to:
  /// **'All data is stored encrypted on this phone. Nothing is sent to the internet.'**
  String get privacyNote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'si', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'si':
      return AppLocalizationsSi();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
