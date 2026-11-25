// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTagline => 'கிராம உத்தியோகத்தர் பிரிவுத் தகவல்கள்';

  @override
  String dbOpenError(String error) {
    return 'தரவுத்தளத்தைத் திறக்க முடியவில்லை.\n\n$error';
  }

  @override
  String get biometricReason => 'SmartGrama-வைத் திறக்க';

  @override
  String get yes => 'ஆம்';

  @override
  String get no => 'இல்லை';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get ok => 'சரி';

  @override
  String get save => 'சேமி';

  @override
  String get remove => 'நீக்கு';

  @override
  String get add => 'சேர்';

  @override
  String get edit => 'திருத்து';

  @override
  String get confirmTitle => 'உறுதிப்படுத்தவும்';

  @override
  String get continueAction => 'தொடர்க';

  @override
  String get other => 'வேறு';

  @override
  String get notes => 'குறிப்புகள்';

  @override
  String get note => 'குறிப்பு';

  @override
  String get name => 'பெயர்';

  @override
  String get phoneNumber => 'தொலைபேசி இலக்கம்';

  @override
  String get phone => 'தொலைபேசி';

  @override
  String get searchHint => 'தேடு';

  @override
  String get notFound => 'கிடைக்கவில்லை';

  @override
  String get nothingHere => 'எதுவும் இல்லை';

  @override
  String get notSpecified => 'குறிப்பிடப்படவில்லை';

  @override
  String ageN(int age) {
    return 'வயது $age';
  }

  @override
  String resultsN(int count) {
    return 'முடிவுகள் $count';
  }

  @override
  String get statusDraft => 'வரைவு';

  @override
  String get statusComplete => 'பூர்த்தி';

  @override
  String get statusVerified => 'சரிபார்க்கப்பட்டது';

  @override
  String get land => 'காணி';

  @override
  String get lands => 'காணிகள்';

  @override
  String get buildings => 'கட்டடங்கள்';

  @override
  String get families => 'குடும்பங்கள்';

  @override
  String get family => 'குடும்பம்';

  @override
  String get persons => 'நபர்கள்';

  @override
  String get person => 'நபர்';

  @override
  String get people => 'மக்கள்';

  @override
  String get trees => 'மரங்கள்';

  @override
  String get animals => 'விலங்குகள்';

  @override
  String get houses => 'வீடுகள்';

  @override
  String get crops => 'பயிர்கள்';

  @override
  String get photos => 'புகைப்படங்கள்';

  @override
  String get treesAndCrops => 'மரங்கள் & பயிர்கள்';

  @override
  String get summary => 'சுருக்கம்';

  @override
  String get history => 'வரலாறு';

  @override
  String get review => 'மீளாய்வு';

  @override
  String get population => 'சனத்தொகை';

  @override
  String get male => 'ஆண்';

  @override
  String get female => 'பெண்';

  @override
  String get valuableTrees => 'பெறுமதியான மரங்கள்';

  @override
  String get valuableTimberTrees => 'பெறுமதியான / வெட்டு மரங்கள்';

  @override
  String get countedTrees => 'எண்ணப்பட்ட மரங்கள்';

  @override
  String get dilapidatedHouses => 'சிதைவடைந்த வீடுகள்';

  @override
  String get landsWithDisputes => 'பிணக்குள்ள காணிகள்';

  @override
  String get adultsWithoutNic =>
      'அடையாள அட்டை இலக்கம் இல்லாத வயதுவந்தோர் (16+)';

  @override
  String get language => 'மொழி';

  @override
  String get languageChoose => 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get languageChangeLater => 'இதைப் பின்னர் அமைப்புகளில் மாற்றலாம்.';

  @override
  String get languageDataUnchanged =>
      'காட்சி மொழி மட்டுமே மாறும்; உங்கள் தரவு மாறாது.';

  @override
  String get navHome => 'முகப்பு';

  @override
  String get navSearch => 'தேடல்';

  @override
  String get navMap => 'வரைபடம்';

  @override
  String get navReports => 'அறிக்கைகள்';

  @override
  String get pinEnter => 'உங்கள் PIN இலக்கத்தை உள்ளிடவும்';

  @override
  String get pinCreate => 'புதிய 6 இலக்க PIN ஒன்றை உருவாக்கவும்';

  @override
  String get pinConfirm => 'PIN இலக்கத்தை மீண்டும் உள்ளிடவும்';

  @override
  String get pinMismatch =>
      'PIN இலக்கங்கள் பொருந்தவில்லை — மீண்டும் முயற்சிக்கவும்';

  @override
  String get pinLockedOut =>
      '5 தவறான முயற்சிகள் — 30 வினாடிகள் காத்திருக்கவும்';

  @override
  String get pinWrong => 'தவறான PIN இலக்கம்';

  @override
  String get greetingMorning => 'காலை வணக்கம்';

  @override
  String get greetingAfternoon => 'மதிய வணக்கம்';

  @override
  String get greetingEvening => 'மாலை வணக்கம்';

  @override
  String get welcome => 'வணக்கம்!';

  @override
  String welcomeName(String name) {
    return 'வணக்கம், $name';
  }

  @override
  String dashIssues(int count) {
    return 'சரிபார்க்க வேண்டியவை $count';
  }

  @override
  String get dashIssuesHint => 'அடையாள அட்டைகள், GPS, புகைப்படங்கள், நகல்கள்…';

  @override
  String get dashAtAGlance => 'பிரிவு ஒரே பார்வையில்';

  @override
  String dashMaleFemale(int male, int female) {
    return 'ஆ $male • பெ $female';
  }

  @override
  String get dashQuickAccess => 'விரைவு அணுகல்';

  @override
  String get dashLists => 'பட்டியல்கள்';

  @override
  String get dashVillageProgress => 'கிராம வாரியான முன்னேற்றம்';

  @override
  String get dashNoVillages =>
      'இன்னும் கிராமங்கள் இல்லை — அமைப்புகளில் சேர்க்கவும்.';

  @override
  String get dashExpectedHint =>
      'குறிப்பு: அமைப்புகள் → கிராமங்கள் & வீட்டுக் குழுக்கள் இல் \"தோராயமான காணிகள் / வீடுகளின் எண்ணிக்கை\"யை வழங்கினால் முன்னேற்றம் சரியாகக் காட்டப்படும்.';

  @override
  String get surveyProgress => 'கணக்கெடுப்பு முன்னேற்றம்';

  @override
  String placesDone(int done, int target) {
    return '$target இடங்களில் $done பூர்த்தி';
  }

  @override
  String todayN(int count) {
    return 'இன்று $count';
  }

  @override
  String verifiedN(int count) {
    return 'சரிபார்த்தவை $count';
  }

  @override
  String get newPlaceTitle => 'புதிய இடத்தைச் சேர்க்கவும்';

  @override
  String get newPlaceSub =>
      'காணி • கட்டடங்கள் • குடும்பங்கள் • மரங்கள் • விலங்குகள்';

  @override
  String landsSummary(int all, int done) {
    return 'காணிகள் $all • பூர்த்தி $done';
  }

  @override
  String get newPlace => 'புதிய இடம்';

  @override
  String get allVillages => 'அனைத்துக் கிராமங்களும்';

  @override
  String get allGroups => 'அனைத்துக் குழுக்களும்';

  @override
  String landsEmpty(String button) {
    return 'இங்கு காணிகள் இல்லை.\nசேர்க்க \"$button\" என்பதை அழுத்தவும்.';
  }

  @override
  String get searchSubtitle => 'நபர்கள், காணிகள், கட்டடங்கள்';

  @override
  String get searchFieldHint => 'பெயர், அடையாள அட்டை, காணி, உறுதி இலக்கம்…';

  @override
  String get searchEmptyHint =>
      'பெயர், அடையாள அட்டை இலக்கம், தொலைபேசி இலக்கம்,\nகாணியின் பெயர் அல்லது உறுதி இலக்கத்தைத் தட்டச்சு செய்யவும்';

  @override
  String get searchNoResults => 'எதுவும் கிடைக்கவில்லை';

  @override
  String get mapSubtitle => 'காணிகள், வீடுகள், பெறுமதியான மரங்கள் வரைபடத்தில்';

  @override
  String mapLandCounts(int buildings, int persons, int trees, int animals) {
    return 'கட்டடங்கள் $buildings • நபர்கள் $persons • மரங்கள் $trees • விலங்குகள் $animals';
  }

  @override
  String get openLand => 'காணியைத் திற';

  @override
  String mapNoGps(String button) {
    return 'GPS உள்ள காணிகள் இன்னும் இல்லை. காணியைச் சேர்க்கும்போது \"$button\" என்பதை அழுத்தவும்.';
  }

  @override
  String get reportsSubtitle =>
      'புள்ளிவிவரங்கள், பட்டியல்கள், தரவுச் சரிபார்ப்பு';

  @override
  String get exportWarning =>
      'Excel கோப்பில் அனைத்துத் தனிப்பட்ட விவரங்களும் (பெயர்கள், அடையாள அட்டை இலக்கங்கள், தொலைபேசி இலக்கங்கள்) உள்ளன.\nஉத்தியோகபூர்வ பணிகளுக்கு மட்டும், பாதுகாப்பாகப் பகிரவும்.';

  @override
  String get exportAction => 'ஏற்றுமதி செய்';

  @override
  String get statsTitle => 'பிரிவுப் புள்ளிவிவரங்கள்';

  @override
  String get statsHubSub => 'சனத்தொகை, வீடுகள், காணிகள், மரங்கள், விலங்குகள்';

  @override
  String get readyListsTitle => 'தயார் பட்டியல்கள்';

  @override
  String readyListsHubSub(int total, int withData) {
    return 'பட்டியல்கள் $total • தரவுள்ளவை $withData';
  }

  @override
  String get qualityTitle => 'தரவுச் சரிபார்ப்பு';

  @override
  String get qualityNoIssues => 'சிக்கல்கள் இல்லை';

  @override
  String qualityToCheckShort(int count) {
    return 'சரிபார்க்க $count';
  }

  @override
  String qualityToCheck(int count) {
    return 'சரிபார்க்க வேண்டியவை $count';
  }

  @override
  String get qualityAllGood => 'அனைத்தும் சரி ✓';

  @override
  String get excelExport => 'Excel ஏற்றுமதி';

  @override
  String get excelExportSub => 'அனைத்துத் தரவும் ஒரே கோப்பில்';

  @override
  String get wholeDivision => 'முழுப் பிரிவு';

  @override
  String get statsLive =>
      'நேரடி — தரவை உள்ளிடும்போது தானாகப் புதுப்பிக்கப்படும்';

  @override
  String awayN(int count) {
    return 'தற்காலிகமாக இல்லாதோர் $count';
  }

  @override
  String get statAgeGroups => 'வயதுப் பிரிவுகள்';

  @override
  String get statDisabled => 'மாற்றுத்திறன்';

  @override
  String get statVoters => 'வாக்காளர்கள் (18+)';

  @override
  String get statHousesPermanence => 'வீடுகள் — நிரந்தரத்தன்மை';

  @override
  String get statHousesCondition => 'வீடுகள் — நிலைமை';

  @override
  String get statToilets => 'மலசலகூடங்கள்';

  @override
  String get statAllBuildings => 'அனைத்துக் கட்டடங்களும்';

  @override
  String get statTotalExtent => 'மொத்தப் பரப்பளவு';

  @override
  String get statLandsOwnership => 'காணிகள் — உரிமை';

  @override
  String get statLandsUse => 'காணிகள் — பயன்பாடு';

  @override
  String get statTreesCounted => 'மரங்கள் (எண்ணப்பட்டவை)';

  @override
  String get statCropsPerches => 'பயிர்கள் (பேர்ச்)';

  @override
  String get statCropsPlants => 'பயிர்கள் (கன்றுகள்)';

  @override
  String get statDailyMilk => 'நாளாந்தப் பால் உற்பத்தி';

  @override
  String litresN(String value) {
    return '$value லீற்றர்';
  }

  @override
  String get readyListsSubtitle => 'ஒரே தொடுதலில் — Excel ஆகவும் பெறலாம்';

  @override
  String get rlElderly60 => '60 வயதும் அதற்கு மேற்பட்டோரும்';

  @override
  String get rlAlone70 => 'தனியாக வாழும் 70+ வயதினர்';

  @override
  String get rlUnder5 => '5 வயது வரையான சிறுவர்கள்';

  @override
  String get rlSchool => 'பாடசாலை செல்லும் சிறுவர்கள்';

  @override
  String get rlDisabled => 'மாற்றுத்திறனாளிகள்';

  @override
  String get rlAway => 'வெளிநாட்டில் / தற்காலிகமாக இல்லாதோர்';

  @override
  String get rlWelfare => 'நலன்புரி நன்மைகள் பெறும் குடும்பங்கள்';

  @override
  String get rlTempHouses => 'தற்காலிக / அரை நிரந்தர வீடுகள்';

  @override
  String get rlNoToilet => 'மலசலகூடம் இல்லாத வீடுகள்';

  @override
  String get rlNoPower => 'மின்சாரம் இல்லாத வீடுகள்';

  @override
  String get rlUnsafeWater => 'பாதுகாப்பான நீர் இல்லாத வீடுகள்';

  @override
  String get rlStateLand => 'அரச / அனுமதியற்ற காணிகளில் வசிக்கும் குடும்பங்கள்';

  @override
  String get rlMilk => 'கறவை விலங்குகள் உள்ள குடும்பங்கள் / காணிகள்';

  @override
  String get rlDogs => 'தடுப்பூசி போடப்படாத நாய்கள்';

  @override
  String get rlTimber => 'வெட்டு / பெறுமதியான மரங்கள் உள்ள காணிகள்';

  @override
  String get rlHazardTrees => 'ஆபத்தான மரங்கள்';

  @override
  String gradeN(String grade) {
    return 'தரம் $grade';
  }

  @override
  String familyOf(String name) {
    return '$name இன் குடும்பம்';
  }

  @override
  String get familyNoHead => 'குடும்பம் (தலைவர் இல்லை)';

  @override
  String milkPerDay(String value) {
    return 'நாளொன்றுக்கு $value லீ.';
  }

  @override
  String dogsN(int count) {
    return 'நாய்கள் $count';
  }

  @override
  String metresN(int value) {
    return '$value மீ.';
  }

  @override
  String lastVerifiedYear(String year) {
    return 'இறுதியாகச் சரிபார்த்தது $year';
  }

  @override
  String get qSameNic => 'பலருக்கு ஒரே அடையாள அட்டை இலக்கம்';

  @override
  String get qInvalidNic => 'செல்லுபடியற்ற அடையாள அட்டை இலக்கங்கள்';

  @override
  String get qNoDob => 'பிறந்த திகதி இல்லாதோர்';

  @override
  String get qNoGps => 'GPS இல்லாத காணிகள்';

  @override
  String get qPoorGps => 'GPS துல்லியம் குறைந்த காணிகள் (10 மீ+)';

  @override
  String get qNoHousePhoto => 'புகைப்படம் இல்லாத வீடுகள்';

  @override
  String get qDraft => 'இன்னும் வரைவு நிலையில் உள்ள காணிகள்';

  @override
  String get qStale => 'ஒரு வருடத்திற்கு மேல் சரிபார்க்கப்படாத காணிகள்';

  @override
  String get ckGps => 'GPS இருப்பிடம்';

  @override
  String get ckExtent => 'காணியின் பரப்பளவு';

  @override
  String get ckOwner => 'உரிமையாளர்';

  @override
  String ckOwnerHint(String tab) {
    return '\"$tab\" தாவலில் உரிமையாளரைச் சேர்க்கவும்';
  }

  @override
  String get ckNoneHintBuildings =>
      'கட்டடங்கள் இல்லையெனில் \"இல்லை\" எனக் குறிக்கவும்';

  @override
  String get ckHousePhotos => 'வீடுகளின் புகைப்படங்கள்';

  @override
  String get ckHouseFamilies => 'வீடுகளில் குடும்பங்கள்';

  @override
  String ckHouseFamiliesHint(String vacant) {
    return 'வீடு வெறுமையாக இருந்தால் பயன்பாட்டை \"$vacant\" எனத் தேர்ந்தெடுக்கவும்';
  }

  @override
  String get ckMembers => 'குடும்ப உறுப்பினர்கள்';

  @override
  String get ckNoneHintTrees =>
      'மரங்கள் இல்லையெனில் \"இல்லை\" எனக் குறிக்கவும்';

  @override
  String get ckNoneHintAnimals =>
      'விலங்குகள் இல்லையெனில் \"இல்லை\" எனக் குறிக்கவும்';

  @override
  String wGpsAccuracy(int metres) {
    return 'GPS துல்லியம் $metres மீ — மீண்டும் பெறுவது நல்லது';
  }

  @override
  String wTooManyTrees(String extent, int count) {
    return '$extent காணியில் $count மரங்கள் — பரப்பளவையோ எண்ணிக்கையையோ சரிபார்க்கவும்';
  }

  @override
  String get wNoHead => 'ஒரு குடும்பத்திற்குத் தலைவர் தேர்ந்தெடுக்கப்படவில்லை';

  @override
  String wManyHeads(int count) {
    return 'ஒரு குடும்பத்தில் $count தலைவர்கள்';
  }

  @override
  String wOlderThanHead(String name) {
    return '$name தலைவரை விட வயதில் மூத்தவர் — உறவுமுறையைச் சரிபார்க்கவும்';
  }

  @override
  String wNoDob(String name) {
    return '$name — பிறந்த திகதி இல்லை';
  }

  @override
  String wNoNic(String name, int age) {
    return '$name — அடையாள அட்டை இலக்கம் இல்லை (வயது $age)';
  }

  @override
  String wInvalidNic(String name) {
    return '$name — அடையாள அட்டை இலக்கம் செல்லுபடியற்றது';
  }

  @override
  String wDobNicMismatch(String name) {
    return '$name — பிறந்த திகதி அடையாள அட்டையுடன் பொருந்தவில்லை';
  }

  @override
  String wSameNic(String first, String second) {
    return '$first மற்றும் $second — ஒரே அடையாள அட்டை இலக்கம்';
  }

  @override
  String get nicEmpty => 'அடையாள அட்டை இலக்கம் வெறுமையாக உள்ளது';

  @override
  String get nicBadFormat =>
      'தவறான வடிவம் — 9 இலக்கங்கள் + V/X அல்லது 12 இலக்கங்கள் இருக்க வேண்டும்';

  @override
  String get nicBadDay => 'பிறந்த நாள் இலக்கம் செல்லுபடியற்றது';

  @override
  String get nicFeb29 => 'பெப்ரவரி 29 — நெட்டாண்டு அல்ல';

  @override
  String get nicFuture => 'பிறந்த திகதி எதிர்காலத்தில் உள்ளது';

  @override
  String get nicBadYear => 'பிறந்த ஆண்டு செல்லுபடியற்றது';

  @override
  String extentAcres(String value) {
    return 'ஏக்கர் $value';
  }

  @override
  String extentRoods(String value) {
    return 'ரூட் $value';
  }

  @override
  String extentPerches(String value) {
    return 'பேர்ச் $value';
  }

  @override
  String extentHectares(String value) {
    return 'ஹெக்டேயர் $value';
  }

  @override
  String get unitArp => 'ஏ-ரூ-பே';

  @override
  String get unitAcres => 'ஏக்கர்';

  @override
  String get unitRoods => 'ரூட்';

  @override
  String get unitPerches => 'பேர்ச்';

  @override
  String get unitHectares => 'ஹெக்டேயர்';

  @override
  String get fVillage => 'கிராமம்';

  @override
  String get fHouseGroup => 'வீட்டுக் குழு';

  @override
  String get fLandName => 'காணியின் பெயர்';

  @override
  String get fAddress => 'முகவரி';

  @override
  String get fExtentPerches => 'பரப்பளவு (பேர்ச்)';

  @override
  String get fExtent => 'பரப்பளவு';

  @override
  String get fOwnership => 'உரிமை';

  @override
  String get fOwners => 'உரிமையாளர்கள்';

  @override
  String get fDeedNo => 'உறுதி இலக்கம்';

  @override
  String get fDeedPermitNo => 'உறுதி / அனுமதிப்பத்திர இலக்கம்';

  @override
  String get fPlanNo => 'வரைபட இலக்கம்';

  @override
  String get fLotNo => 'துண்டு இலக்கம்';

  @override
  String get fPlanLotNo => 'வரைபட / துண்டு இலக்கம்';

  @override
  String get fScheme => 'குடியேற்றத் திட்டம்';

  @override
  String get fUse => 'பயன்பாடு';

  @override
  String get fSubdivision => 'உட்பிரிவு';

  @override
  String get fNorth => 'வடக்கு';

  @override
  String get fEast => 'கிழக்கு';

  @override
  String get fSouth => 'தெற்கு';

  @override
  String get fWest => 'மேற்கு';

  @override
  String get fDispute => 'பிணக்கு';

  @override
  String get fLatitude => 'அகலாங்கு';

  @override
  String get fLongitude => 'நெட்டாங்கு';

  @override
  String get fGpsAccuracyM => 'GPS துல்லியம் (மீ)';

  @override
  String get fStatus => 'நிலை';

  @override
  String get fVerifiedOn => 'சரிபார்த்த திகதி';

  @override
  String get fVerified => 'சரிபார்த்தது';

  @override
  String get fType => 'வகை';

  @override
  String get fNumber => 'இலக்கம்';

  @override
  String get fFloors => 'மாடிகள்';

  @override
  String get fSqft => 'சதுர அடி';

  @override
  String get fRooms => 'அறைகள்';

  @override
  String get fYearBuilt => 'கட்டப்பட்ட ஆண்டு';

  @override
  String get fWater => 'நீர்';

  @override
  String get fApproval => 'அனுமதி';

  @override
  String get fHead => 'தலைவர்';

  @override
  String get fMembers => 'உறுப்பினர்கள்';

  @override
  String get fIncomeSource => 'வருமான மூலம்';

  @override
  String get fFuel => 'எரிபொருள்';

  @override
  String get fWelfare => 'நலன்புரி';

  @override
  String get fSinceYear => 'வசிக்கத் தொடங்கிய ஆண்டு';

  @override
  String get fFullName => 'முழுப் பெயர்';

  @override
  String get fNameWithInitials => 'முதலெழுத்துகளுடன் பெயர்';

  @override
  String get fNic => 'அடையாள அட்டை';

  @override
  String get fDob => 'பிறந்த திகதி';

  @override
  String get fAge => 'வயது';

  @override
  String get fSex => 'பால்';

  @override
  String get fRelation => 'உறவுமுறை';

  @override
  String get fGrade => 'தரம்';

  @override
  String get fWorkplace => 'பணியிடம்';

  @override
  String get fVoter => 'வாக்காளர்';

  @override
  String get fIllnesses => 'நோய்கள்';

  @override
  String get fBearing => 'காய்க்கும்';

  @override
  String get fYoungTrees => 'இளம்';

  @override
  String get fTotal => 'மொத்தம்';

  @override
  String get fGirthIn => 'சுற்றளவு (அங்.)';

  @override
  String get fHeightFt => 'உயரம் (அடி)';

  @override
  String get fHazardous => 'ஆபத்தானது';

  @override
  String get fCrop => 'பயிர்';

  @override
  String get fAmount => 'அளவு';

  @override
  String get fMaleAnimals => 'ஆண்';

  @override
  String get fFemaleAnimals => 'பெண்';

  @override
  String get fYoungAnimals => 'குட்டிகள்';

  @override
  String get fMilkPerDay => 'பால் (லீ./நாள்)';

  @override
  String get fVaccinated => 'தடுப்பூசி';

  @override
  String get fLastVaccination => 'இறுதித் தடுப்பூசி';

  @override
  String get fDetails => 'விவரங்கள்';

  @override
  String get sheetPeople => 'நபர்கள்';

  @override
  String get sheetTreesCounted => 'மரங்கள் (எண்ணிக்கை)';

  @override
  String get sheetList => 'பட்டியல்';

  @override
  String get landNew => 'புதிய காணி';

  @override
  String get landEdit => 'காணியைத் திருத்து';

  @override
  String get landNameRequired => 'காணியின் பெயர் கட்டாயம்';

  @override
  String get selectHouseGroup => 'வீட்டுக் குழுவைத் தேர்ந்தெடுக்கவும்';

  @override
  String get extentInvalid => 'காணியின் பரப்பளவு செல்லுபடியற்றது';

  @override
  String arpOddConfirm(String extent) {
    return '4 ரூட் அல்லது 40 பேர்ச் அல்லது அதற்கு மேற்பட்ட பெறுமதி உள்ளது. மொத்தப் பரப்பளவை $extent எனச் சேமிக்கவா?';
  }

  @override
  String deedDupConfirm(String deed, String land) {
    return 'உறுதி இலக்கம் \"$deed\" ஏற்கனவே \"$land\" காணிக்கு உள்ளது. இருந்தும் சேமிக்கவா?';
  }

  @override
  String get villageGroupField => 'கிராமம் / வீட்டுக் குழு *';

  @override
  String get landNameField => 'காணியின் பெயர் *';

  @override
  String get landNameHint => 'உ-ம்: பலாத்தோட்டம்';

  @override
  String get addressField => 'முகவரி / இட விவரம்';

  @override
  String get subdivisionAllowed => 'உட்பிரிவுக்கு அனுமதி';

  @override
  String ownersAddLater(String section) {
    return 'காணியைச் சேமித்த பின் உரிமையாளர்களையும் குடியிருப்பாளர்களையும் \"$section\" பகுதியில் சேர்க்கவும்.';
  }

  @override
  String get boundaries => 'எல்லைகள்';

  @override
  String get hasDispute => 'பிணக்கு உள்ளது';

  @override
  String get disputeNote => 'பிணக்கு பற்றிய குறிப்பு';

  @override
  String get otherNotes => 'ஏனைய குறிப்புகள்';

  @override
  String get disputeExists => 'உள்ளது';

  @override
  String get gpsNotTaken => 'GPS இருப்பிடம் பெறப்படவில்லை';

  @override
  String gpsAccuracyPoor(int metres) {
    return 'துல்லியம் $metres மீ — குறைவு, மீண்டும் பெறவும்';
  }

  @override
  String gpsAccuracy(int metres) {
    return 'துல்லியம் $metres மீ';
  }

  @override
  String get gpsRetake => 'மீண்டும்';

  @override
  String get gpsTake => 'GPS பெறு';

  @override
  String get gpsServiceOff => 'தொலைபேசியின் Location (GPS) ஐ இயக்கவும்';

  @override
  String get gpsDenied =>
      'இருப்பிடத்தைப் பெற அனுமதி இல்லை — Settings இல் அனுமதி வழங்கவும்';

  @override
  String get gpsFailed =>
      'GPS பெற முடியவில்லை — திறந்த வெளிக்குச் சென்று மீண்டும் முயற்சிக்கவும்';

  @override
  String photoFailed(String error) {
    return 'புகைப்படத்தைப் பெற முடியவில்லை: $error';
  }

  @override
  String get camera => 'கமரா';

  @override
  String get gallery => 'படத்தொகுப்பு';

  @override
  String get photoDeleteConfirm => 'இந்தப் புகைப்படத்தை நீக்கவா?';

  @override
  String get newItem => 'புதிய உருப்படி';

  @override
  String get addNewItem => 'புதிய உருப்படியைச் சேர்க்கவும்';

  @override
  String get pickLists => 'தெரிவுப் பட்டியல்கள்';

  @override
  String get pickListsSub =>
      'மரங்கள், விலங்குகள், பயிர்கள் போன்ற வகைகளைச் சேர்த்தல்';

  @override
  String itemsN(int count) {
    return '$count உருப்படிகள்';
  }

  @override
  String get addedByYou => 'நீங்கள் சேர்த்தவை';

  @override
  String get shown => 'காட்டப்படுகிறது';

  @override
  String get hidden => 'மறைக்கப்பட்டுள்ளது';

  @override
  String get customItemsNote =>
      'நீங்கள் சேர்க்கும் உருப்படிகள் எல்லா மொழிகளிலும் அதே பெயரில் காட்டப்படும்.';

  @override
  String get landNotFound => 'காணி கிடைக்கவில்லை';

  @override
  String get landRemoved => 'இந்தக் காணி நீக்கப்பட்டுள்ளது';

  @override
  String get stepByStep => 'படிப்படியாக';

  @override
  String get landDeleteConfirm =>
      'இந்தக் காணியையும் அதன் கட்டடங்கள், குடும்பங்கள், மரங்கள், விலங்குகள் அனைத்தையும் நீக்கவா?\n(தவறுதலாக உள்ளிடப்பட்டிருந்தால் மட்டும். வரலாற்றில் இருக்கும்.)';

  @override
  String get landDelete => 'காணியை நீக்கு';

  @override
  String percentComplete(int percent) {
    return '$percent% பூர்த்தி';
  }

  @override
  String get forCompleteness => 'முழுமைக்காக';

  @override
  String get onThisLand => 'இந்தக் காணியில்';

  @override
  String get completeness => 'தகவல் முழுமை';

  @override
  String get allSectionsComplete => 'அனைத்துப் பகுதிகளும் பூர்த்தி 🎉';

  @override
  String sectionsDone(int done, int total, String missing) {
    return '$total பகுதிகளில் $done பூர்த்தி.\nமீதமுள்ளவை: $missing';
  }

  @override
  String nicDupElsewhere(String nic, String name) {
    return '$nic — வேறோர் இடத்தில் $name எனவும் உள்ளது (நகலா?)';
  }

  @override
  String pleaseCheckN(int count) {
    return 'சரிபார்க்கவும் ($count)';
  }

  @override
  String markCompleteConfirm(int count, String status) {
    return 'இன்னும் $count பகுதிகள் பூர்த்தியாகவில்லை. \"$status\" எனக் குறிக்கவா?';
  }

  @override
  String get markComplete => 'பூர்த்தி';

  @override
  String get verify => 'சரிபார்';

  @override
  String get backToDraft => 'மீண்டும் வரைவுக்கு';

  @override
  String get landDetails => 'காணி விவரங்கள்';

  @override
  String get noBuildingsOnLand => 'இந்தக் காணியில் கட்டடங்கள் இல்லை';

  @override
  String roomsN(int count) {
    return 'அறைகள் $count';
  }

  @override
  String familiesN(int count) {
    return 'குடும்பங்கள் $count';
  }

  @override
  String get noPhotosWarning => '⚠ புகைப்படங்கள் இல்லை';

  @override
  String get addHouseFirstConfirm =>
      'குடும்பத்தைச் சேர்க்க முதலில் வீட்டைச் சேர்க்க வேண்டும். இப்போது வீட்டைச் சேர்க்கவா?';

  @override
  String get landParties => 'காணியுடன் தொடர்புடைய நபர்கள்';

  @override
  String get landPartiesHint =>
      'உரிமையாளர், குடியிருப்பாளர், வாரிசு போன்றோரை இங்கே சேர்க்கவும்.';

  @override
  String shareN(String share) {
    return 'பங்கு $share';
  }

  @override
  String get outsideDivision => 'பிரிவுக்கு வெளியே';

  @override
  String get addFamilyButton => 'குடும்பம்';

  @override
  String get addMember => 'உறுப்பினரைச் சேர்க்கவும்';

  @override
  String noFamiliesYet(String button) {
    return 'இன்னும் குடும்பங்கள் சேர்க்கப்படவில்லை. \"$button\" பொத்தானை அழுத்தவும்.';
  }

  @override
  String get countAction => 'எண்ணு';

  @override
  String bearingYoung(int bearing, int young) {
    return 'காய்க்கும் $bearing • இளம் $young';
  }

  @override
  String get singleTree => 'தனி மரம்';

  @override
  String girthInN(String value) {
    return 'சுற்றளவு $value அங்.';
  }

  @override
  String heightFtN(String value) {
    return 'உயரம் $value அடி';
  }

  @override
  String get hazardWarning => '⚠ ஆபத்தானது';

  @override
  String get addCropButton => 'பயிர்';

  @override
  String get noTreesOnLand => 'இந்தக் காணியில் மரங்கள் / பயிர்கள் இல்லை';

  @override
  String animalCountsShort(int male, int female, int young) {
    return 'ஆ. $male • பெ. $female • கு. $young';
  }

  @override
  String milkLitresPerDay(String value) {
    return 'பால் $value லீ./நாள்';
  }

  @override
  String vaccinatedValue(String value) {
    return 'தடுப்பூசி: $value';
  }

  @override
  String get noAnimalsOnLand => 'இந்தக் காணியில் விலங்குகள் இல்லை';

  @override
  String get landPhotos => 'காணியின் புகைப்படங்கள்';

  @override
  String get otherPhotos => 'கட்டடங்கள் / மரங்களின் புகைப்படங்கள்';

  @override
  String get noHistory => 'வரலாறு இல்லை';

  @override
  String get entLandParty => 'காணியுடன் தொடர்புடைய நபர்';

  @override
  String get entBuilding => 'கட்டடம்';

  @override
  String get entResidenceEvent => 'வசிப்பிட மாற்றம்';

  @override
  String get entTree => 'தனி மரம்';

  @override
  String get entCrop => 'பயிர்';

  @override
  String get entPhoto => 'புகைப்படம்';

  @override
  String get actCreate => 'சேர்க்கப்பட்டது';

  @override
  String get actUpdate => 'மாற்றப்பட்டது';

  @override
  String get actDelete => 'நீக்கப்பட்டது';

  @override
  String stepOf(int step, int total, String name) {
    return 'படி $step / $total — $name';
  }

  @override
  String get back => 'பின்';

  @override
  String nextStep(String name) {
    return 'அடுத்து: $name';
  }

  @override
  String get finish => 'முடி';

  @override
  String get nextPlace => 'அடுத்த இடம்';

  @override
  String get evArrived => 'குடிவந்தார்';

  @override
  String get evLeft => 'குடிபெயர்ந்தார்';

  @override
  String get evBirth => 'பிறப்பு';

  @override
  String get evDeath => 'இறப்பு';

  @override
  String get evAway => 'தற்காலிகமாக வெளியே சென்றார்';

  @override
  String get evReturned => 'திரும்பி வந்தார்';

  @override
  String nicDerived(String dob, String sex) {
    return 'பிறந்த திகதி $dob • $sex — அடையாள அட்டையிலிருந்து';
  }

  @override
  String get nameRequired => 'பெயர் கட்டாயம்';

  @override
  String nicInvalidConfirm(String error) {
    return 'அடையாள அட்டை இலக்கம் செல்லுபடியற்றது ($error). இருந்தும் சேமிக்கவா?';
  }

  @override
  String get dobMismatchConfirm =>
      'உள்ளிட்ட பிறந்த திகதி அடையாள அட்டையுடன் பொருந்தவில்லை. இருந்தும் சேமிக்கவா?';

  @override
  String nicDupConfirm(String names) {
    return 'இந்த அடையாள அட்டை இலக்கம் ஏற்கனவே பதிவேட்டில் உள்ளது: $names\n\nஒரே நபர் இருமுறை உள்ளிடப்பட்டுள்ளாரா எனச் சரிபார்க்கவும். இருந்தும் சேமிக்கவா?';
  }

  @override
  String nicLaterNote(int age) {
    return 'குறிப்பு: வயது $age — அடையாள அட்டை இலக்கத்தைப் பின்னர் சேர்க்கவும்';
  }

  @override
  String twoHeadsConfirm(String name) {
    return '$name ஏற்கனவே தலைவராக உள்ளார். குடும்பத்திற்கு இரண்டு தலைவர்கள் ஆகிவிடுவர். இருந்தும் சேமிக்கவா?';
  }

  @override
  String olderThanHeadConfirm(String name) {
    return 'இந்த நபர் தலைவரை ($name) விட வயதில் மூத்தவர். உறவுமுறை சரியா?';
  }

  @override
  String get newMember => 'புதிய உறுப்பினர்';

  @override
  String get removeIfMistake => 'தவறுதலாக உள்ளிடப்பட்டிருந்தால் நீக்கவும்';

  @override
  String personDeleteConfirm(String field) {
    return 'தவறுதலாக உள்ளிடப்பட்டிருந்தால் மட்டும் நீக்கவும்.\nகுடிபெயர்ந்திருந்தால் / இறந்திருந்தால் \"$field\" ஐ மாற்றவும்.\n\nநீக்கவா?';
  }

  @override
  String get fullNameField => 'முழுப் பெயர் *';

  @override
  String get nicField => 'தேசிய அடையாள அட்டை இலக்கம்';

  @override
  String get eduAndWork => 'கல்வி & தொழில்';

  @override
  String get gradeSchoolField => 'தரம் / பாடசாலை';

  @override
  String get healthOther => 'சுகாதாரம் & ஏனையவை';

  @override
  String get chronicIllnessField => 'நீண்டகால நோய்கள் (விருப்பத்தேர்வு)';

  @override
  String get isVoterField => 'வாக்காளரா?';

  @override
  String statusChangedOn(String date) {
    return 'மாற்றத் திகதி: $date';
  }

  @override
  String get nameOrNicHint => 'பெயர் அல்லது அடையாள அட்டை இலக்கம்';

  @override
  String get pickFromRegister => 'பதிவேட்டிலிருந்து தேர்ந்தெடுக்கவும்';

  @override
  String get pickFromRegisterSub => 'பிரிவில் வசிப்பவர் எனில்';

  @override
  String get outsideNameField =>
      'அல்லது பெயர் (பிரிவுக்கு வெளியே வசிப்பவர் எனில்)';

  @override
  String get shareField => 'பங்கு (விருப்பத்தேர்வு)';

  @override
  String get shareHint => 'உ-ம்: 1/2';

  @override
  String get pickPersonOrName =>
      'ஒரு நபரைத் தேர்ந்தெடுக்கவும் அல்லது பெயரை உள்ளிடவும்';

  @override
  String get nicCard => 'தேசிய அடையாள அட்டை';

  @override
  String get nicInvalidNumber => '⚠ செல்லுபடியற்ற இலக்கம்';

  @override
  String get personalDetails => 'தனிப்பட்ட விவரங்கள்';

  @override
  String get livesAt => 'வசிக்கும் இடம்';

  @override
  String get otherFamilyMembers => 'குடும்பத்தின் ஏனையோர்';

  @override
  String get linkedLands => 'தொடர்புடைய காணிகள்';

  @override
  String get residenceHistory => 'வசிப்பிட வரலாறு';

  @override
  String get selectBuildingType => 'கட்டட வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get yearBuiltInvalid => 'கட்டப்பட்ட ஆண்டு செல்லுபடியற்றது';

  @override
  String get newBuilding => 'புதிய கட்டடம்';

  @override
  String get buildingDeleteConfirm =>
      'இந்தக் கட்டடத்தையும் அதில் வசிக்கும் குடும்பங்களையும் நீக்கவா? (வரலாற்றில் இருக்கும்)';

  @override
  String get buildingNoField => 'வீட்டு / கட்டட இலக்கம்';

  @override
  String get buildingNoHint => 'பிரதேச சபை இலக்கம் இருப்பின்';

  @override
  String get floorsField => 'மாடிகளின் எண்ணிக்கை';

  @override
  String get floorAreaField => 'தரைப் பரப்பு (சதுர அடி)';

  @override
  String get roomsField => 'அறைகளின் எண்ணிக்கை';

  @override
  String get materials => 'கட்டுமானப் பொருட்கள்';

  @override
  String get yearBuiltField => 'கட்டப்பட்ட ஆண்டு (தோராயமாக)';

  @override
  String get facilities => 'வசதிகள்';

  @override
  String get buildingApproval => 'கட்டட அனுமதி';

  @override
  String get housePhotoRequired => 'வீட்டின் முன்பக்கப் புகைப்படம் கட்டாயம்.';

  @override
  String get selectFamilyHouse =>
      'குடும்பம் வசிக்கும் வீட்டைத் தேர்ந்தெடுக்கவும்';

  @override
  String get sinceYearInvalid => 'குடிவந்த ஆண்டு செல்லுபடியற்றது';

  @override
  String get newFamily => 'புதிய குடும்பம்';

  @override
  String get familyDetails => 'குடும்ப விவரங்கள்';

  @override
  String get familyDeleteConfirm =>
      'இந்தக் குடும்பத்தையும் உறுப்பினர்களையும் நீக்கவா? (வரலாற்றில் இருக்கும்)';

  @override
  String get livingBuildingField => 'வசிக்கும் கட்டடம் *';

  @override
  String get sinceYearField => 'குடிவந்த ஆண்டு';

  @override
  String treeCountTitle(int count) {
    return 'மரக் கணக்கெடுப்பு ($count)';
  }

  @override
  String get youngNotBearing => 'இளம் / காய்க்காதவை';

  @override
  String get addSpecies => 'வகையைச் சேர்க்கவும்';

  @override
  String get otherSpecies => 'வேறு வகை';

  @override
  String timberHint(String button) {
    return 'தேக்கு, மஹோகனி போன்ற பெறுமதியான வெட்டு மரங்களைச் சுற்றளவுடன் \"$button\" எனத் தனியாகச் சேர்க்கவும்.';
  }

  @override
  String get selectTreeSpecies => 'மர வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get girthInvalid => 'சுற்றளவு (அங்குலம்) செல்லுபடியற்றது';

  @override
  String get treeDeleteConfirm =>
      'இந்த மரத்தை நீக்கவா? (வெட்டப்பட்டிருந்தால் குறிப்பொன்றையும் இடவும்)';

  @override
  String get girthField => 'மார்பு உயரச் சுற்றளவு (அங்குலம்)';

  @override
  String get girthHint => 'நிலத்திலிருந்து 4½ அடி உயரத்தில்';

  @override
  String get heightField => 'தோராய உயரம் (அடி)';

  @override
  String get treeAgeField => 'தோராய வயது (ஆண்டுகள்)';

  @override
  String get hazardousField => 'ஆபத்தானது';

  @override
  String get hazardousHint => 'வீட்டின் / மின் கம்பியின் மீது விழக்கூடும்';

  @override
  String get selectCrop => 'பயிரைத் தேர்ந்தெடுக்கவும்';

  @override
  String get newCrop => 'புதிய பயிர்';

  @override
  String get cropDeleteConfirm => 'இந்தப் பயிரை நீக்கவா?';

  @override
  String get selectAnimal => 'விலங்கு வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get enterCount => 'எண்ணிக்கையை உள்ளிடவும்';

  @override
  String milkPerAnimalConfirm(String litres) {
    return 'ஒரு விலங்குக்கு நாளொன்றுக்கு $litres லீற்றர் பால் — சரியா?';
  }

  @override
  String get addAnimals => 'விலங்குகளைச் சேர்க்கவும்';

  @override
  String get recordDeleteConfirm => 'இந்தப் பதிவை நீக்கவா?';

  @override
  String get dailyMilkField => 'நாளாந்தப் பால் (லீற்றர்)';

  @override
  String get rabiesVaccinated => 'விசர்நாய்த் தடுப்பூசி போடப்பட்டதா?';

  @override
  String get vaccinatedQuestion => 'தடுப்பூசி போடப்பட்டதா?';

  @override
  String get lastVaccinationDate => 'இறுதித் தடுப்பூசித் திகதி';

  @override
  String lastVaccinationOn(String date) {
    return 'இறுதித் தடுப்பூசி: $date';
  }

  @override
  String get ownerFamily => 'உரிமையாளர் குடும்பம்';

  @override
  String get villagesAndGroups => 'கிராமங்கள் & வீட்டுக் குழுக்கள்';

  @override
  String get addVillageButton => 'கிராமம்';

  @override
  String get needOneGroup =>
      'குறைந்தது ஒரு கிராமத்தையும் ஒரு வீட்டுக் குழுவையும் சேர்க்கவும்';

  @override
  String get structureEmpty =>
      'உங்கள் பிரிவின் கிராமங்களைச் சேர்க்கவும். பின்னர் ஒவ்வொரு கிராமத்திற்கும் வீட்டுக் குழுக்களை (உ-ம்: 1001/01) சேர்க்கவும்.';

  @override
  String supervisingValue(String name) {
    return 'மேற்பார்வை உத்தியோகத்தர்: $name';
  }

  @override
  String leaderValue(String name) {
    return 'தலைவர்: $name';
  }

  @override
  String landsN(int count) {
    return 'காணிகள் $count';
  }

  @override
  String get addHouseGroup => 'வீட்டுக் குழுவைச் சேர்க்கவும்';

  @override
  String get newVillage => 'புதிய கிராமம்';

  @override
  String get villageNameField => 'கிராமத்தின் பெயர் *';

  @override
  String get supervisingOfficerField => 'மேற்பார்வை உத்தியோகத்தர்';

  @override
  String get supervisingOfficerHint =>
      'உ-ம்: சமுர்த்தி அபிவிருத்தி உத்தியோகத்தர்';

  @override
  String get removeGroupsFirst =>
      'முதலில் இங்குள்ள வீட்டுக் குழுக்களை நீக்கவும்';

  @override
  String get newHouseGroup => 'புதிய வீட்டுக் குழு';

  @override
  String get groupNoField => 'குழு இலக்கம் *';

  @override
  String get groupNoHint => 'உ-ம்: 1001/01';

  @override
  String get groupLeaderField => 'குழுத் தலைவர்';

  @override
  String get leaderPhoneField => 'தலைவரின் தொலைபேசி';

  @override
  String get expectedLandsField => 'தோராயமான காணிகள் / வீடுகளின் எண்ணிக்கை';

  @override
  String get expectedLandsHint => 'கணக்கெடுப்பு முன்னேற்றத்திற்காக';

  @override
  String groupHasLands(int count) {
    return 'இந்தக் குழுவில் $count காணிகள் உள்ளன — நீக்க முடியாது';
  }

  @override
  String get codeNameRequired => 'பிரிவு இலக்கமும் பெயரும் கட்டாயம்';

  @override
  String get divisionDetails => 'பிரிவு விவரங்கள்';

  @override
  String get setupWelcome =>
      'வணக்கம்! முதலில் உங்கள் கிராம உத்தியோகத்தர் பிரிவின் விவரங்களை உள்ளிடவும்.';

  @override
  String get divisionNoField => 'பிரிவு இலக்கம் *';

  @override
  String get divisionNoHint => 'உ-ம்: 1001';

  @override
  String get divisionNameField => 'பிரிவின் பெயர் *';

  @override
  String get divisionNameHint => 'உ-ம்: ஹாரகம';

  @override
  String get dsDivisionField => 'பிரதேச செயலாளர் பிரிவு';

  @override
  String get dsDivisionHint => 'உ-ம்: பாதஹேவாஹெட்ட';

  @override
  String get districtField => 'மாவட்டம்';

  @override
  String get districtHint => 'உ-ம்: கண்டி';

  @override
  String get gnNameField => 'கிராம உத்தியோகத்தரின் பெயர்';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get settingsSubtitle =>
      'பிரிவு, மொழி, தோற்றம், பாதுகாப்பு, காப்புப்பிரதி';

  @override
  String get division => 'பிரிவு';

  @override
  String get divisionDetailsSub => 'இலக்கம், பெயர், உத்தியோகத்தர்';

  @override
  String get textSize => 'எழுத்து அளவு';

  @override
  String get sizeNormal => 'சாதாரண';

  @override
  String get sizeLarge => 'பெரிய';

  @override
  String get sizeXLarge => 'மிகப் பெரிய';

  @override
  String get security => 'பாதுகாப்பு';

  @override
  String get changePin => 'PIN இலக்கத்தை மாற்று';

  @override
  String get pinChanged => 'PIN இலக்கம் மாற்றப்பட்டது';

  @override
  String get biometric => 'கைரேகை / முகம்';

  @override
  String get biometricSub => 'PIN இல்லாமல் திறத்தல்';

  @override
  String get autoLock => 'தானியங்கிப் பூட்டு';

  @override
  String get lockImmediately => 'உடனடியாக';

  @override
  String minutesN(int count) {
    return '$count நிமிடங்கள்';
  }

  @override
  String get backup => 'காப்புப்பிரதி';

  @override
  String get createBackup => 'காப்புப்பிரதியை உருவாக்கு';

  @override
  String get noBackupYet =>
      'இன்னும் இல்லை — தொலைபேசி தொலைந்தால் தரவு இழக்கப்படும்';

  @override
  String lastBackup(String date) {
    return 'இறுதியாக: $date';
  }

  @override
  String get restoreFromBackup => 'காப்புப்பிரதியிலிருந்து மீட்டெடு';

  @override
  String get backupPassword => 'காப்புப்பிரதிக் கடவுச்சொல்';

  @override
  String get backupPasswordWarning =>
      'இந்தக் கடவுச்சொல் இல்லாமல் காப்புப்பிரதியைத் திறக்க முடியாது. பாதுகாப்பாக நினைவில் வைத்திருக்கவும்.';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get passwordRepeat => 'மீண்டும் கடவுச்சொல்';

  @override
  String get passwordMin => 'குறைந்தது 6 எழுத்துகள்';

  @override
  String get passwordMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get backupShareText => 'SmartGrama மறைகுறியாக்கப்பட்ட காப்புப்பிரதி';

  @override
  String backupFailed(String error) {
    return 'காப்புப்பிரதி தோல்வியடைந்தது: $error';
  }

  @override
  String get restoreConfirm =>
      'காப்புப்பிரதியிலிருந்து மீட்டெடுத்தால் தற்போதைய அனைத்துத் தரவும் நீக்கப்பட்டு காப்புப்பிரதியின் தரவு மட்டுமே இருக்கும். தொடரவா?';

  @override
  String get restoreDone => 'மீட்டெடுப்பு வெற்றிகரமானது';

  @override
  String restoreFailed(String error) {
    return 'மீட்டெடுப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String get backupPasswordTooShort =>
      'கடவுச்சொல் குறைந்தது 6 எழுத்துகளாக இருக்க வேண்டும்';

  @override
  String get backupWrongPassword =>
      'கடவுச்சொல் தவறு, அல்லது இது SmartGrama காப்புப்பிரதிக் கோப்பு அல்ல';

  @override
  String backupOtherVersion(int version) {
    return 'இந்தக் காப்புப்பிரதி வேறொரு பதிப்பில் உருவாக்கப்பட்டது ($version)';
  }

  @override
  String get backupNotSmartGrama =>
      'இது SmartGrama காப்புப்பிரதிக் கோப்பு அல்ல';

  @override
  String get developer => 'உருவாக்குநர் (debug)';

  @override
  String get addDemoData => 'மாதிரித் தரவைச் சேர்';

  @override
  String get testingOnly => 'சோதனைக்கு மட்டும்';

  @override
  String get demoDataAdded => 'மாதிரித் தரவு சேர்க்கப்பட்டது';

  @override
  String get privacyNote =>
      'அனைத்துத் தரவும் இந்தத் தொலைபேசியில் மறைகுறியாக்கப்பட்டுச் (encrypted) சேமிக்கப்படுகிறது. இணையத்திற்கு எதுவும் அனுப்பப்படுவதில்லை.';
}
