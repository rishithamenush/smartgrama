// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTagline => 'ග්‍රාම නිලධාරී වසම් තොරතුරු';

  @override
  String dbOpenError(String error) {
    return 'දත්ත ගබඩාව විවෘත කළ නොහැක.\n\n$error';
  }

  @override
  String get biometricReason => 'SmartGrama විවෘත කිරීමට';

  @override
  String get yes => 'ඔව්';

  @override
  String get no => 'නැත';

  @override
  String get cancel => 'අවලංගු';

  @override
  String get ok => 'හරි';

  @override
  String get save => 'සුරකින්න';

  @override
  String get remove => 'ඉවත් කරන්න';

  @override
  String get add => 'එකතු කරන්න';

  @override
  String get edit => 'සංස්කරණය';

  @override
  String get confirmTitle => 'තහවුරු කරන්න';

  @override
  String get continueAction => 'ඉදිරියට';

  @override
  String get other => 'වෙනත්';

  @override
  String get notes => 'සටහන්';

  @override
  String get note => 'සටහන';

  @override
  String get name => 'නම';

  @override
  String get phoneNumber => 'දුරකථන අංකය';

  @override
  String get phone => 'දුරකථනය';

  @override
  String get searchHint => 'සොයන්න';

  @override
  String get notFound => 'හමු නොවීය';

  @override
  String get nothingHere => 'කිසිවක් නැත';

  @override
  String get notSpecified => 'සඳහන් කර නැත';

  @override
  String ageN(int age) {
    return 'වයස $age';
  }

  @override
  String resultsN(int count) {
    return 'ප්‍රතිඵල $count';
  }

  @override
  String get statusDraft => 'කෙටුම්පත';

  @override
  String get statusComplete => 'සම්පූර්ණයි';

  @override
  String get statusVerified => 'තහවුරු කළා';

  @override
  String get land => 'ඉඩම';

  @override
  String get lands => 'ඉඩම්';

  @override
  String get buildings => 'ගොඩනැගිලි';

  @override
  String get families => 'පවුල්';

  @override
  String get family => 'පවුල';

  @override
  String get persons => 'පුද්ගලයින්';

  @override
  String get person => 'පුද්ගලයා';

  @override
  String get people => 'මිනිසුන්';

  @override
  String get trees => 'ගස්';

  @override
  String get animals => 'සතුන්';

  @override
  String get houses => 'නිවාස';

  @override
  String get crops => 'බෝග';

  @override
  String get photos => 'ඡායාරූප';

  @override
  String get treesAndCrops => 'ගස් හා බෝග';

  @override
  String get summary => 'සාරාංශය';

  @override
  String get history => 'ඉතිහාසය';

  @override
  String get review => 'සමාලෝචනය';

  @override
  String get population => 'ජනගහනය';

  @override
  String get male => 'පුරුෂ';

  @override
  String get female => 'ස්ත්‍රී';

  @override
  String get valuableTrees => 'වටිනා ගස්';

  @override
  String get valuableTimberTrees => 'වටිනා / දැව ගස්';

  @override
  String get countedTrees => 'ගණනය කළ ගස්';

  @override
  String get dilapidatedHouses => 'අබලන් නිවාස';

  @override
  String get landsWithDisputes => 'ආරවුල් ඇති ඉඩම්';

  @override
  String get adultsWithoutNic => 'හැඳුනුම්පත් අංකය නැති වැඩිහිටියන් (16+)';

  @override
  String get language => 'භාෂාව';

  @override
  String get languageChoose => 'භාෂාව තෝරන්න';

  @override
  String get languageChangeLater => 'පසුව සැකසුම් වලින් වෙනස් කළ හැක.';

  @override
  String get languageDataUnchanged =>
      'පෙන්වන භාෂාව පමණක් වෙනස් වේ; දත්ත වෙනස් නොවේ.';

  @override
  String get navHome => 'මුල් පිටුව';

  @override
  String get navSearch => 'සෙවීම';

  @override
  String get navMap => 'සිතියම';

  @override
  String get navReports => 'වාර්තා';

  @override
  String get pinEnter => 'PIN අංකය ඇතුළත් කරන්න';

  @override
  String get pinCreate => 'නව PIN අංකයක් (අංක 6) සාදන්න';

  @override
  String get pinConfirm => 'PIN අංකය නැවත ඇතුළත් කරන්න';

  @override
  String get pinMismatch => 'PIN අංක නොගැළපේ — නැවත උත්සාහ කරන්න';

  @override
  String get pinLockedOut => 'වැරදි උත්සාහ 5 ක් — තත්පර 30 ක් රැඳී සිටින්න';

  @override
  String get pinWrong => 'වැරදි PIN අංකයකි';

  @override
  String get greetingMorning => 'සුභ උදෑසනක්';

  @override
  String get greetingAfternoon => 'සුභ දහවලක්';

  @override
  String get greetingEvening => 'සුභ සන්ධ්‍යාවක්';

  @override
  String get welcome => 'ආයුබෝවන්!';

  @override
  String welcomeName(String name) {
    return 'ආයුබෝවන් $name';
  }

  @override
  String dashIssues(int count) {
    return 'දත්ත පරීක්ෂා කිරීමට $count ක් ඇත';
  }

  @override
  String get dashIssuesHint => 'හැඳුනුම්පත්, GPS, ඡායාරූප, අනුපිටපත්…';

  @override
  String get dashAtAGlance => 'වසම එක බැල්මෙන්';

  @override
  String dashMaleFemale(int male, int female) {
    return 'පු $male • ස්ත්‍රී $female';
  }

  @override
  String get dashQuickAccess => 'ඉක්මන් ප්‍රවේශය';

  @override
  String get dashLists => 'ලැයිස්තු';

  @override
  String get dashVillageProgress => 'ගම්මාන අනුව ප්‍රගතිය';

  @override
  String get dashNoVillages => 'ගම්මාන තවම නැත — සැකසුම් වලින් එකතු කරන්න.';

  @override
  String get dashExpectedHint =>
      'ඉඟිය: සැකසුම් → ගම්මාන හා ගෘහ කණ්ඩායම් හි \"දළ ඉඩම් / නිවාස ගණන\" දුන් විට ප්‍රගතිය නිවැරදිව පෙන්වයි.';

  @override
  String get surveyProgress => 'සමීක්ෂණ ප්‍රගතිය';

  @override
  String placesDone(int done, int target) {
    return 'ස්ථාන $done / $target සම්පූර්ණයි';
  }

  @override
  String todayN(int count) {
    return 'අද $count';
  }

  @override
  String verifiedN(int count) {
    return 'තහවුරු $count';
  }

  @override
  String get newPlaceTitle => 'නව ස්ථානයක් ඇතුළත් කරන්න';

  @override
  String get newPlaceSub => 'ඉඩම • ගොඩනැගිලි • පවුල් • ගස් • සතුන්';

  @override
  String landsSummary(int all, int done) {
    return 'ඉඩම් $all • සම්පූර්ණ $done';
  }

  @override
  String get newPlace => 'නව ස්ථානයක්';

  @override
  String get allVillages => 'සියලු ගම්මාන';

  @override
  String get allGroups => 'සියලු කණ්ඩායම්';

  @override
  String landsEmpty(String button) {
    return 'මෙහි ඉඩම් නැත.\n\"$button\" ඔබා ඇතුළත් කරන්න.';
  }

  @override
  String get searchSubtitle => 'පුද්ගලයින්, ඉඩම්, ගොඩනැගිලි';

  @override
  String get searchFieldHint => 'නම, හැඳුනුම්පත, ඉඩම, ඔප්පු අංකය…';

  @override
  String get searchEmptyHint =>
      'නම, හැඳුනුම්පත් අංකය, දුරකථන අංකය,\nඉඩමේ නම හෝ ඔප්පු අංකය ටයිප් කරන්න';

  @override
  String get searchNoResults => 'කිසිවක් හමු නොවීය';

  @override
  String get mapSubtitle => 'ඉඩම්, නිවාස හා වටිනා ගස් සිතියම මත';

  @override
  String mapLandCounts(int buildings, int persons, int trees, int animals) {
    return 'ගොඩනැගිලි $buildings • පුද්ගලයින් $persons • ගස් $trees • සතුන් $animals';
  }

  @override
  String get openLand => 'ඉඩම විවෘත කරන්න';

  @override
  String mapNoGps(String button) {
    return 'GPS සහිත ඉඩම් තවම නැත. ඉඩමක් ඇතුළත් කිරීමේදී \"$button\" ඔබන්න.';
  }

  @override
  String get reportsSubtitle => 'සංඛ්‍යාලේඛන, ලැයිස්තු, දත්ත පරීක්ෂාව';

  @override
  String get exportWarning =>
      'Excel ගොනුවේ සියලු පුද්ගලික තොරතුරු (නම්, හැඳුනුම්පත් අංක, දුරකථන) ඇතුළත් වේ.\nනිල කටයුතු සඳහා පමණක්, ආරක්ෂිතව බෙදාගන්න.';

  @override
  String get exportAction => 'අපනයනය කරන්න';

  @override
  String get statsTitle => 'වසම් සංඛ්‍යාලේඛන';

  @override
  String get statsHubSub => 'ජනගහනය, නිවාස, ඉඩම්, ගස්, සතුන්';

  @override
  String get readyListsTitle => 'සූදානම් ලැයිස්තු';

  @override
  String readyListsHubSub(int total, int withData) {
    return 'ලැයිස්තු $total • දත්ත ඇති $withData';
  }

  @override
  String get qualityTitle => 'දත්ත පරීක්ෂාව';

  @override
  String get qualityNoIssues => 'ගැටලු නැත';

  @override
  String qualityToCheckShort(int count) {
    return 'පරීක්ෂා කිරීමට $count';
  }

  @override
  String qualityToCheck(int count) {
    return 'පරීක්ෂා කිරීමට $count ක් ඇත';
  }

  @override
  String get qualityAllGood => 'සියල්ල හරි ✓';

  @override
  String get excelExport => 'Excel අපනයනය';

  @override
  String get excelExportSub => 'සියලු දත්ත එක් ගොනුවකට';

  @override
  String get wholeDivision => 'මුළු වසම';

  @override
  String get statsLive => 'සජීවී — ඇතුළත් කරන විට ස්වයංක්‍රීයව යාවත්කාලීන වේ';

  @override
  String awayN(int count) {
    return 'තාවකාලිකව නැති $count';
  }

  @override
  String get statAgeGroups => 'වයස් කාණ්ඩ';

  @override
  String get statDisabled => 'ආබාධිත';

  @override
  String get statVoters => 'ඡන්ද හිමි (18+)';

  @override
  String get statHousesPermanence => 'නිවාස — ස්ථිරභාවය';

  @override
  String get statHousesCondition => 'නිවාස — තත්ත්වය';

  @override
  String get statToilets => 'වැසිකිළි';

  @override
  String get statAllBuildings => 'සියලු ගොඩනැගිලි';

  @override
  String get statTotalExtent => 'මුළු ප්‍රමාණය';

  @override
  String get statLandsOwnership => 'ඉඩම් — අයිතිය';

  @override
  String get statLandsUse => 'ඉඩම් — භාවිතය';

  @override
  String get statTreesCounted => 'ගස් (ගණනය කළ)';

  @override
  String get statCropsPerches => 'බෝග (පර්චස්)';

  @override
  String get statCropsPlants => 'බෝග (පැළ)';

  @override
  String get statDailyMilk => 'දෛනික කිරි නිෂ්පාදනය';

  @override
  String litresN(String value) {
    return 'ලීටර් $value';
  }

  @override
  String get readyListsSubtitle => 'එක තට්ටුවකින් — Excel ලෙසද ලබාගත හැක';

  @override
  String get rlElderly60 => 'වයස 60 ට වැඩි අය';

  @override
  String get rlAlone70 => 'වයස 70+ තනිව ජීවත් වන අය';

  @override
  String get rlUnder5 => 'වයස 5 ට අඩු ළමුන්';

  @override
  String get rlSchool => 'පාසල් යන ළමුන්';

  @override
  String get rlDisabled => 'ආබාධිත පුද්ගලයින්';

  @override
  String get rlAway => 'විදේශගත / තාවකාලිකව නැති අය';

  @override
  String get rlWelfare => 'සුබසාධන ප්‍රතිලාභ ලබන පවුල්';

  @override
  String get rlTempHouses => 'තාවකාලික / අර්ධ ස්ථිර නිවාස';

  @override
  String get rlNoToilet => 'වැසිකිළි නැති නිවාස';

  @override
  String get rlNoPower => 'විදුලිය නැති නිවාස';

  @override
  String get rlUnsafeWater => 'ආරක්ෂිත ජලය නැති නිවාස';

  @override
  String get rlStateLand => 'රජයේ / අනවසර ඉඩම්වල පදිංචි පවුල්';

  @override
  String get rlMilk => 'කිරි සතුන් ඇති පවුල් / ඉඩම්';

  @override
  String get rlDogs => 'එන්නත් නොකළ සුනඛයින්';

  @override
  String get rlTimber => 'දැව / වටිනා ගස් ඇති ඉඩම්';

  @override
  String get rlHazardTrees => 'අනතුරුදායක ගස්';

  @override
  String gradeN(String grade) {
    return 'ශ්‍රේණිය $grade';
  }

  @override
  String familyOf(String name) {
    return '$name ගේ පවුල';
  }

  @override
  String get familyNoHead => 'පවුල (ප්‍රධානියා නැත)';

  @override
  String milkPerDay(String value) {
    return 'දිනකට ලී. $value';
  }

  @override
  String dogsN(int count) {
    return 'සුනඛයින් $count';
  }

  @override
  String metresN(int value) {
    return 'මී. $value';
  }

  @override
  String lastVerifiedYear(String year) {
    return 'අවසන් වරට $year';
  }

  @override
  String get qSameNic => 'එකම හැඳුනුම්පත් අංකය කිහිප දෙනෙකුට';

  @override
  String get qInvalidNic => 'වලංගු නැති හැඳුනුම්පත් අංක';

  @override
  String get qNoDob => 'උපන් දිනය නැති අය';

  @override
  String get qNoGps => 'GPS නැති ඉඩම්';

  @override
  String get qPoorGps => 'GPS නිරවද්‍යතාව අඩු ඉඩම් (මීටර් 10+)';

  @override
  String get qNoHousePhoto => 'ඡායාරූප නැති නිවාස';

  @override
  String get qDraft => 'තවම කෙටුම්පත් ලෙස ඇති ඉඩම්';

  @override
  String get qStale => 'අවුරුද්දකට වඩා තහවුරු නොකළ ඉඩම්';

  @override
  String get ckGps => 'GPS ස්ථානය';

  @override
  String get ckExtent => 'ඉඩමේ ප්‍රමාණය';

  @override
  String get ckOwner => 'අයිතිකරු';

  @override
  String ckOwnerHint(String tab) {
    return '\"$tab\" ටැබයෙන් අයිතිකරු එකතු කරන්න';
  }

  @override
  String get ckNoneHintBuildings =>
      'ගොඩනැගිලි නැත්නම් \"නැත\" ලෙස සලකුණු කරන්න';

  @override
  String get ckHousePhotos => 'නිවාසවල ඡායාරූප';

  @override
  String get ckHouseFamilies => 'නිවාසවල පවුල්';

  @override
  String ckHouseFamiliesHint(String vacant) {
    return 'හිස් නිවසක් නම් භාවිතය \"$vacant\" ලෙස තෝරන්න';
  }

  @override
  String get ckMembers => 'පවුල් සාමාජිකයින්';

  @override
  String get ckNoneHintTrees => 'ගස් නැත්නම් \"නැත\" ලෙස සලකුණු කරන්න';

  @override
  String get ckNoneHintAnimals => 'සතුන් නැත්නම් \"නැත\" ලෙස සලකුණු කරන්න';

  @override
  String wGpsAccuracy(int metres) {
    return 'GPS නිරවද්‍යතාව මීටර් $metres — නැවත ගැනීම සුදුසුයි';
  }

  @override
  String wTooManyTrees(String extent, int count) {
    return '$extent ඉඩමකට ගස් $count ක් — ප්‍රමාණය හෝ ගණන පරීක්ෂා කරන්න';
  }

  @override
  String get wNoHead => 'පවුලක ප්‍රධානියා තෝරා නැත';

  @override
  String wManyHeads(int count) {
    return 'එක් පවුලක ප්‍රධානියන් $count දෙනෙක්';
  }

  @override
  String wOlderThanHead(String name) {
    return '$name ප්‍රධානියාට වඩා වයසින් වැඩියි — සම්බන්ධතාව පරීක්ෂා කරන්න';
  }

  @override
  String wNoDob(String name) {
    return '$name — උපන් දිනය නැත';
  }

  @override
  String wNoNic(String name, int age) {
    return '$name — හැඳුනුම්පත් අංකය නැත (වයස $age)';
  }

  @override
  String wInvalidNic(String name) {
    return '$name — හැඳුනුම්පත් අංකය වලංගු නැත';
  }

  @override
  String wDobNicMismatch(String name) {
    return '$name — උපන් දිනය හැඳුනුම්පත සමඟ නොගැළපේ';
  }

  @override
  String wSameNic(String first, String second) {
    return '$first හා $second — එකම හැඳුනුම්පත් අංකය';
  }

  @override
  String get nicEmpty => 'හැඳුනුම්පත් අංකය හිස්ය';

  @override
  String get nicBadFormat => 'වැරදි ආකෘතියකි — අංක 9 + V/X හෝ අංක 12 විය යුතුය';

  @override
  String get nicBadDay => 'උපන් දින අංකය වලංගු නැත';

  @override
  String get nicFeb29 => 'පෙබරවාරි 29 — අධික අවුරුද්දක් නොවේ';

  @override
  String get nicFuture => 'උපන් දිනය අනාගතයේ';

  @override
  String get nicBadYear => 'උපන් වර්ෂය වලංගු නැත';

  @override
  String extentAcres(String value) {
    return 'අක්. $value';
  }

  @override
  String extentRoods(String value) {
    return 'රූ. $value';
  }

  @override
  String extentPerches(String value) {
    return 'පර්. $value';
  }

  @override
  String extentHectares(String value) {
    return 'හෙක්. $value';
  }

  @override
  String get unitArp => 'අක්-රූ-පර්';

  @override
  String get unitAcres => 'අක්කර';

  @override
  String get unitRoods => 'රූඩ්';

  @override
  String get unitPerches => 'පර්චස්';

  @override
  String get unitHectares => 'හෙක්ටයාර';

  @override
  String get fVillage => 'ගම්මානය';

  @override
  String get fHouseGroup => 'ගෘහ කණ්ඩායම';

  @override
  String get fLandName => 'ඉඩමේ නම';

  @override
  String get fAddress => 'ලිපිනය';

  @override
  String get fExtentPerches => 'ප්‍රමාණය (පර්චස්)';

  @override
  String get fExtent => 'ප්‍රමාණය';

  @override
  String get fOwnership => 'අයිතිය';

  @override
  String get fOwners => 'අයිතිකරුවන්';

  @override
  String get fDeedNo => 'ඔප්පු අංකය';

  @override
  String get fDeedPermitNo => 'ඔප්පු / බලපත්‍ර අංකය';

  @override
  String get fPlanNo => 'පිඹුරු අංකය';

  @override
  String get fLotNo => 'කට්ටි අංකය';

  @override
  String get fPlanLotNo => 'පිඹුරු / කට්ටි අංකය';

  @override
  String get fScheme => 'ජනපදය';

  @override
  String get fUse => 'භාවිතය';

  @override
  String get fSubdivision => 'අතුරු බෙදීම්';

  @override
  String get fNorth => 'උතුර';

  @override
  String get fEast => 'නැගෙනහිර';

  @override
  String get fSouth => 'දකුණ';

  @override
  String get fWest => 'බටහිර';

  @override
  String get fDispute => 'ආරවුල';

  @override
  String get fLatitude => 'අක්ෂාංශ';

  @override
  String get fLongitude => 'දේශාංශ';

  @override
  String get fGpsAccuracyM => 'GPS නිරවද්‍යතාව (මී)';

  @override
  String get fStatus => 'තත්ත්වය';

  @override
  String get fVerifiedOn => 'තහවුරු කළ දිනය';

  @override
  String get fVerified => 'තහවුරු කළේ';

  @override
  String get fType => 'වර්ගය';

  @override
  String get fNumber => 'අංකය';

  @override
  String get fFloors => 'මහල්';

  @override
  String get fSqft => 'වර්ග අඩි';

  @override
  String get fRooms => 'කාමර';

  @override
  String get fYearBuilt => 'ඉදිකළ වර්ෂය';

  @override
  String get fWater => 'ජලය';

  @override
  String get fApproval => 'අනුමැතිය';

  @override
  String get fHead => 'ප්‍රධානියා';

  @override
  String get fMembers => 'සාමාජිකයින්';

  @override
  String get fIncomeSource => 'ආදායම් මාර්ගය';

  @override
  String get fFuel => 'ඉන්ධන';

  @override
  String get fWelfare => 'සුබසාධන';

  @override
  String get fSinceYear => 'පදිංචි වර්ෂය';

  @override
  String get fFullName => 'සම්පූර්ණ නම';

  @override
  String get fNameWithInitials => 'මුලකුරු සහිත නම';

  @override
  String get fNic => 'හැඳුනුම්පත';

  @override
  String get fDob => 'උපන් දිනය';

  @override
  String get fAge => 'වයස';

  @override
  String get fSex => 'ස්ත්‍රී/පුරුෂ';

  @override
  String get fRelation => 'සම්බන්ධතාව';

  @override
  String get fGrade => 'ශ්‍රේණිය';

  @override
  String get fWorkplace => 'රැකියා ස්ථානය';

  @override
  String get fVoter => 'ඡන්ද හිමි';

  @override
  String get fIllnesses => 'රෝග';

  @override
  String get fBearing => 'ඵල දරන';

  @override
  String get fYoungTrees => 'ළපටි';

  @override
  String get fTotal => 'මුළු';

  @override
  String get fGirthIn => 'වට (අඟල්)';

  @override
  String get fHeightFt => 'උස (අඩි)';

  @override
  String get fHazardous => 'අනතුරුදායක';

  @override
  String get fCrop => 'බෝගය';

  @override
  String get fAmount => 'ප්‍රමාණය';

  @override
  String get fMaleAnimals => 'පිරිමි';

  @override
  String get fFemaleAnimals => 'ගැහැණු';

  @override
  String get fYoungAnimals => 'පැටවුන්';

  @override
  String get fMilkPerDay => 'කිරි (ලී./දින)';

  @override
  String get fVaccinated => 'එන්නත්';

  @override
  String get fLastVaccination => 'අවසන් එන්නත';

  @override
  String get fDetails => 'විස්තර';

  @override
  String get sheetPeople => 'පුද්ගලයින්';

  @override
  String get sheetTreesCounted => 'ගස් (ගණනය)';

  @override
  String get sheetList => 'ලැයිස්තුව';

  @override
  String get landNew => 'නව ඉඩමක්';

  @override
  String get landEdit => 'ඉඩම සංස්කරණය';

  @override
  String get landNameRequired => 'ඉඩමේ නම අනිවාර්යයි';

  @override
  String get selectHouseGroup => 'ගෘහ කණ්ඩායම තෝරන්න';

  @override
  String get extentInvalid => 'ඉඩමේ ප්‍රමාණය වලංගු නැත';

  @override
  String arpOddConfirm(String extent) {
    return 'රූඩ් 4 කට හෝ පර්චස් 40 කට වැඩි අගයක් ඇත. මුළු ප්‍රමාණය $extent ලෙස සුරකින්නද?';
  }

  @override
  String deedDupConfirm(String deed, String land) {
    return 'ඔප්පු අංකය \"$deed\" දැනටමත් \"$land\" ඉඩමට ඇත. තවමත් සුරකින්නද?';
  }

  @override
  String get villageGroupField => 'ගම්මානය / ගෘහ කණ්ඩායම *';

  @override
  String get landNameField => 'ඉඩමේ නම *';

  @override
  String get landNameHint => 'උදා: කොස්වත්ත';

  @override
  String get addressField => 'ලිපිනය / ස්ථාන විස්තරය';

  @override
  String get subdivisionAllowed => 'අතුරු බෙදීම්වලට අවසර';

  @override
  String ownersAddLater(String section) {
    return 'අයිතිකරුවන් හා පදිංචිකරුවන් ඉඩම සුරැකීමෙන් පසු \"$section\" කොටසින් එකතු කරන්න.';
  }

  @override
  String get boundaries => 'මායිම්';

  @override
  String get hasDispute => 'ආරවුලක් ඇත';

  @override
  String get disputeNote => 'ආරවුල පිළිබඳ සටහන';

  @override
  String get otherNotes => 'වෙනත් සටහන්';

  @override
  String get disputeExists => 'ඇත';

  @override
  String get gpsNotTaken => 'GPS ස්ථානය ගෙන නැත';

  @override
  String gpsAccuracyPoor(int metres) {
    return 'නිරවද්‍යතාව මී. $metres — අඩුයි, නැවත ගන්න';
  }

  @override
  String gpsAccuracy(int metres) {
    return 'නිරවද්‍යතාව මී. $metres';
  }

  @override
  String get gpsRetake => 'නැවත';

  @override
  String get gpsTake => 'GPS ගන්න';

  @override
  String get gpsServiceOff => 'දුරකථනයේ Location (GPS) සක්‍රිය කරන්න';

  @override
  String get gpsDenied =>
      'ස්ථානය ලබා ගැනීමට අවසර නැත — Settings වලින් අවසර දෙන්න';

  @override
  String get gpsFailed =>
      'GPS ලබා ගැනීමට නොහැකි විය — එළිමහනට ගොස් නැවත උත්සාහ කරන්න';

  @override
  String photoFailed(String error) {
    return 'ඡායාරූපය ගැනීමට නොහැක: $error';
  }

  @override
  String get camera => 'කැමරාව';

  @override
  String get gallery => 'ගැලරිය';

  @override
  String get photoDeleteConfirm => 'මෙම ඡායාරූපය ඉවත් කරන්නද?';

  @override
  String get newItem => 'නව අයිතමයක්';

  @override
  String get addNewItem => 'නව අයිතමයක් එකතු කරන්න';

  @override
  String get pickLists => 'තේරීම් ලැයිස්තු';

  @override
  String get pickListsSub => 'ගස්, සතුන්, බෝග ආදී වර්ග එකතු කිරීම';

  @override
  String itemsN(int count) {
    return '$count අයිතම';
  }

  @override
  String get addedByYou => 'ඔබ එකතු කළ';

  @override
  String get shown => 'පෙන්වයි';

  @override
  String get hidden => 'සඟවා ඇත';

  @override
  String get customItemsNote =>
      'ඔබ එකතු කරන අයිතම සියලු භාෂාවලින් එකම නමින් පෙන්වයි.';

  @override
  String get landNotFound => 'ඉඩම හමු නොවීය';

  @override
  String get landRemoved => 'මෙම ඉඩම ඉවත් කර ඇත';

  @override
  String get stepByStep => 'පියවරෙන් පියවර';

  @override
  String get landDeleteConfirm =>
      'මෙම ඉඩම සහ එහි ගොඩනැගිලි, පවුල්, ගස්, සතුන් සියල්ල ඉවත් කරන්නද?\n(වැරදීමකින් ඇතුළත් කළා නම් පමණි. ඉතිහාසයේ රැඳේ.)';

  @override
  String get landDelete => 'ඉඩම ඉවත් කරන්න';

  @override
  String percentComplete(int percent) {
    return '$percent% සම්පූර්ණයි';
  }

  @override
  String get forCompleteness => 'සම්පූර්ණත්වය සඳහා';

  @override
  String get onThisLand => 'මෙම ඉඩමේ';

  @override
  String get completeness => 'තොරතුරු සම්පූර්ණත්වය';

  @override
  String get allSectionsComplete => 'සියලු කොටස් සම්පූර්ණයි 🎉';

  @override
  String sectionsDone(int done, int total, String missing) {
    return 'කොටස් $done / $total සම්පූර්ණයි.\nඉතිරි: $missing';
  }

  @override
  String nicDupElsewhere(String nic, String name) {
    return '$nic — වෙනත් ස්ථානයක $name ලෙසද ඇත (අනුපිටපතක්ද?)';
  }

  @override
  String pleaseCheckN(int count) {
    return 'පරීක්ෂා කරන්න ($count)';
  }

  @override
  String markCompleteConfirm(int count, String status) {
    return 'තවම සම්පූර්ණ නැති කොටස් $count ක් ඇත. \"$status\" ලෙස සලකුණු කරන්නද?';
  }

  @override
  String get markComplete => 'සම්පූර්ණයි';

  @override
  String get verify => 'තහවුරු කරන්න';

  @override
  String get backToDraft => 'නැවත කෙටුම්පතට';

  @override
  String get landDetails => 'ඉඩමේ තොරතුරු';

  @override
  String get noBuildingsOnLand => 'මෙම ඉඩමේ ගොඩනැගිලි නැත';

  @override
  String roomsN(int count) {
    return 'කාමර $count';
  }

  @override
  String familiesN(int count) {
    return 'පවුල් $count';
  }

  @override
  String get noPhotosWarning => '⚠ ඡායාරූප නැත';

  @override
  String get addHouseFirstConfirm =>
      'පවුලක් එකතු කිරීමට මුලින්ම නිවස එකතු කළ යුතුය. දැන් නිවස එකතු කරන්නද?';

  @override
  String get landParties => 'ඉඩමට සම්බන්ධ පුද්ගලයින්';

  @override
  String get landPartiesHint =>
      'අයිතිකරු, පදිංචිකරු, උරුමකරු ආදී අය මෙහි එකතු කරන්න.';

  @override
  String shareN(String share) {
    return 'කොටස $share';
  }

  @override
  String get outsideDivision => 'වසමෙන් පිටත';

  @override
  String get addFamilyButton => 'පවුලක්';

  @override
  String get addMember => 'සාමාජිකයෙක් එකතු කරන්න';

  @override
  String noFamiliesYet(String button) {
    return 'තවම පවුල් එකතු කර නැත. \"$button\" බොත්තම ඔබන්න.';
  }

  @override
  String get countAction => 'ගණන් කරන්න';

  @override
  String bearingYoung(int bearing, int young) {
    return 'ඵල දරන $bearing • ළපටි $young';
  }

  @override
  String get singleTree => 'තනි ගසක්';

  @override
  String girthInN(String value) {
    return 'වට අඟල් $value';
  }

  @override
  String heightFtN(String value) {
    return 'උස අඩි $value';
  }

  @override
  String get hazardWarning => '⚠ අනතුරුදායක';

  @override
  String get addCropButton => 'බෝගයක්';

  @override
  String get noTreesOnLand => 'මෙම ඉඩමේ ගස් / බෝග නැත';

  @override
  String animalCountsShort(int male, int female, int young) {
    return 'පි. $male • ගැ. $female • පැ. $young';
  }

  @override
  String milkLitresPerDay(String value) {
    return 'කිරි ලී. $value/දින';
  }

  @override
  String vaccinatedValue(String value) {
    return 'එන්නත්: $value';
  }

  @override
  String get noAnimalsOnLand => 'මෙම ඉඩමේ සතුන් නැත';

  @override
  String get landPhotos => 'ඉඩමේ ඡායාරූප';

  @override
  String get otherPhotos => 'ගොඩනැගිලි / ගස්වල ඡායාරූප';

  @override
  String get noHistory => 'ඉතිහාසයක් නැත';

  @override
  String get entLandParty => 'ඉඩමට සම්බන්ධ පුද්ගලයා';

  @override
  String get entBuilding => 'ගොඩනැගිල්ල';

  @override
  String get entResidenceEvent => 'පදිංචි වෙනස්වීම';

  @override
  String get entTree => 'තනි ගස';

  @override
  String get entCrop => 'බෝගය';

  @override
  String get entPhoto => 'ඡායාරූපය';

  @override
  String get actCreate => 'එකතු කළා';

  @override
  String get actUpdate => 'වෙනස් කළා';

  @override
  String get actDelete => 'ඉවත් කළා';

  @override
  String stepOf(int step, int total, String name) {
    return 'පියවර $step / $total — $name';
  }

  @override
  String get back => 'ආපසු';

  @override
  String nextStep(String name) {
    return 'ඊළඟ: $name';
  }

  @override
  String get finish => 'අවසන්';

  @override
  String get nextPlace => 'ඊළඟ ස්ථානය';

  @override
  String get evArrived => 'පදිංචියට පැමිණියා';

  @override
  String get evLeft => 'පදිංචිය හැර ගියා';

  @override
  String get evBirth => 'උපත';

  @override
  String get evDeath => 'මරණය';

  @override
  String get evAway => 'තාවකාලිකව බැහැරට ගියා';

  @override
  String get evReturned => 'නැවත පැමිණියා';

  @override
  String nicDerived(String dob, String sex) {
    return 'උපන් දිනය $dob • $sex — හැඳුනුම්පතින්';
  }

  @override
  String get nameRequired => 'නම අනිවාර්යයි';

  @override
  String nicInvalidConfirm(String error) {
    return 'හැඳුනුම්පත් අංකය වලංගු නැත ($error). තවමත් සුරකින්නද?';
  }

  @override
  String get dobMismatchConfirm =>
      'ඇතුළත් කළ උපන් දිනය හැඳුනුම්පත සමඟ නොගැළපේ. තවමත් සුරකින්නද?';

  @override
  String nicDupConfirm(String names) {
    return 'මෙම හැඳුනුම්පත් අංකය දැනටමත් ලේඛනයේ ඇත: $names\n\nඑකම පුද්ගලයා දෙවරක් ඇතුළත් වී ඇත්දැයි පරීක්ෂා කරන්න. තවමත් සුරකින්නද?';
  }

  @override
  String nicLaterNote(int age) {
    return 'සටහන: වයස $age — හැඳුනුම්පත් අංකය පසුව එකතු කරන්න';
  }

  @override
  String twoHeadsConfirm(String name) {
    return '$name දැනටමත් ප්‍රධානියා ලෙස ඇත. පවුලේ ප්‍රධානියන් දෙදෙනෙක් වේ. තවමත් සුරකින්නද?';
  }

  @override
  String olderThanHeadConfirm(String name) {
    return 'මෙම පුද්ගලයා ප්‍රධානියාට ($name) වඩා වයසින් වැඩියි. සම්බන්ධතාව නිවැරදිද?';
  }

  @override
  String get newMember => 'නව සාමාජිකයෙක්';

  @override
  String get removeIfMistake => 'වැරදීමකින් ඇතුළත් කළා නම් ඉවත් කරන්න';

  @override
  String personDeleteConfirm(String field) {
    return 'වැරදීමකින් ඇතුළත් කළා නම් පමණක් ඉවත් කරන්න.\nපදිංචිය හැර ගියා / මියගියා නම් \"$field\" වෙනස් කරන්න.\n\nඉවත් කරන්නද?';
  }

  @override
  String get fullNameField => 'සම්පූර්ණ නම *';

  @override
  String get nicField => 'ජාතික හැඳුනුම්පත් අංකය';

  @override
  String get eduAndWork => 'අධ්‍යාපනය හා රැකියාව';

  @override
  String get gradeSchoolField => 'ශ්‍රේණිය / පාසල';

  @override
  String get healthOther => 'සෞඛ්‍යය හා වෙනත්';

  @override
  String get chronicIllnessField => 'දීර්ඝකාලීන රෝග (විකල්ප)';

  @override
  String get isVoterField => 'ඡන්ද හිමිද';

  @override
  String statusChangedOn(String date) {
    return 'වෙනස් වූ දිනය: $date';
  }

  @override
  String get nameOrNicHint => 'නම හෝ හැඳුනුම්පත් අංකය';

  @override
  String get pickFromRegister => 'ලේඛනයෙන් තෝරන්න';

  @override
  String get pickFromRegisterSub => 'වසමේ පදිංචි අයෙක් නම්';

  @override
  String get outsideNameField => 'හෝ නම (වසමෙන් පිටත ජීවත් වන අයෙක් නම්)';

  @override
  String get shareField => 'කොටස (විකල්ප)';

  @override
  String get shareHint => 'උදා: 1/2';

  @override
  String get pickPersonOrName => 'පුද්ගලයෙක් තෝරන්න හෝ නම ඇතුළත් කරන්න';

  @override
  String get nicCard => 'ජාතික හැඳුනුම්පත';

  @override
  String get nicInvalidNumber => '⚠ වලංගු නැති අංකයකි';

  @override
  String get personalDetails => 'පුද්ගලික තොරතුරු';

  @override
  String get livesAt => 'ජීවත් වන ස්ථානය';

  @override
  String get otherFamilyMembers => 'පවුලේ අනෙක් අය';

  @override
  String get linkedLands => 'සම්බන්ධ ඉඩම්';

  @override
  String get residenceHistory => 'පදිංචි ඉතිහාසය';

  @override
  String get selectBuildingType => 'ගොඩනැගිලි වර්ගය තෝරන්න';

  @override
  String get yearBuiltInvalid => 'ඉදිකළ වර්ෂය වලංගු නැත';

  @override
  String get newBuilding => 'නව ගොඩනැගිල්ලක්';

  @override
  String get buildingDeleteConfirm =>
      'මෙම ගොඩනැගිල්ල සහ එහි ජීවත් වන පවුල් ඉවත් කරන්නද? (ඉතිහාසයේ රැඳේ)';

  @override
  String get buildingNoField => 'ගෘහ / ගොඩනැගිලි අංකය';

  @override
  String get buildingNoHint => 'ප්‍රාදේශීය සභා අංකය ඇත්නම්';

  @override
  String get floorsField => 'මහල් ගණන';

  @override
  String get floorAreaField => 'බිම් ප්‍රමාණය (වර්ග අඩි)';

  @override
  String get roomsField => 'කාමර ගණන';

  @override
  String get materials => 'ඉදිකිරීම් ද්‍රව්‍ය';

  @override
  String get yearBuiltField => 'ඉදිකළ වර්ෂය (දළ වශයෙන්)';

  @override
  String get facilities => 'පහසුකම්';

  @override
  String get buildingApproval => 'ඉදිකිරීම් අනුමැතිය';

  @override
  String get housePhotoRequired => 'නිවසේ ඉදිරිපස ඡායාරූපයක් අනිවාර්යයි.';

  @override
  String get selectFamilyHouse => 'පවුල ජීවත් වන නිවස තෝරන්න';

  @override
  String get sinceYearInvalid => 'පදිංචියට පැමිණි වර්ෂය වලංගු නැත';

  @override
  String get newFamily => 'නව පවුලක්';

  @override
  String get familyDetails => 'පවුලේ තොරතුරු';

  @override
  String get familyDeleteConfirm =>
      'මෙම පවුල සහ සාමාජිකයින් ඉවත් කරන්නද? (ඉතිහාසයේ රැඳේ)';

  @override
  String get livingBuildingField => 'ජීවත් වන ගොඩනැගිල්ල *';

  @override
  String get sinceYearField => 'පදිංචියට පැමිණි වර්ෂය';

  @override
  String treeCountTitle(int count) {
    return 'ගස් ගණන් කිරීම ($count)';
  }

  @override
  String get youngNotBearing => 'ළපටි / ඵල නොදරන';

  @override
  String get addSpecies => 'වර්ගයක් එකතු කරන්න';

  @override
  String get otherSpecies => 'වෙනත් වර්ගයක්';

  @override
  String timberHint(String button) {
    return 'තේක්ක, මහෝගනී වැනි වටිනා දැව ගස් \"$button\" ලෙස වට ප්‍රමාණය සමඟ වෙනම එකතු කරන්න.';
  }

  @override
  String get selectTreeSpecies => 'ගස් වර්ගය තෝරන්න';

  @override
  String get girthInvalid => 'වට ප්‍රමාණය (අඟල්) වලංගු නැත';

  @override
  String get treeDeleteConfirm =>
      'මෙම ගස ඉවත් කරන්නද? (කපා ඉවත් කළා නම් සටහනක් ද තබන්න)';

  @override
  String get girthField => 'පපු උසින් වට ප්‍රමාණය (අඟල්)';

  @override
  String get girthHint => 'බිම සිට අඩි 4½ උසින්';

  @override
  String get heightField => 'දළ උස (අඩි)';

  @override
  String get treeAgeField => 'දළ වයස (අවුරුදු)';

  @override
  String get hazardousField => 'අනතුරුදායකයි';

  @override
  String get hazardousHint => 'නිවසකට / විදුලි රැහැනකට වැටිය හැක';

  @override
  String get selectCrop => 'බෝගය තෝරන්න';

  @override
  String get newCrop => 'නව බෝගයක්';

  @override
  String get cropDeleteConfirm => 'මෙම බෝගය ඉවත් කරන්නද?';

  @override
  String get selectAnimal => 'සත්ව වර්ගය තෝරන්න';

  @override
  String get enterCount => 'ගණන ඇතුළත් කරන්න';

  @override
  String milkPerAnimalConfirm(String litres) {
    return 'එක් සතෙකුට දිනකට කිරි ලීටර් $litres ක් — නිවැරදිද?';
  }

  @override
  String get addAnimals => 'සතුන් එකතු කරන්න';

  @override
  String get recordDeleteConfirm => 'මෙම සටහන ඉවත් කරන්නද?';

  @override
  String get dailyMilkField => 'දෛනික කිරි (ලීටර්)';

  @override
  String get rabiesVaccinated => 'ජලභීතිකා එන්නත් කර ඇත්ද';

  @override
  String get vaccinatedQuestion => 'එන්නත් කර ඇත්ද';

  @override
  String get lastVaccinationDate => 'අවසන් එන්නත් දිනය';

  @override
  String lastVaccinationOn(String date) {
    return 'අවසන් එන්නත: $date';
  }

  @override
  String get ownerFamily => 'අයිතිකරු පවුල';

  @override
  String get villagesAndGroups => 'ගම්මාන හා ගෘහ කණ්ඩායම්';

  @override
  String get addVillageButton => 'ගම්මානයක්';

  @override
  String get needOneGroup =>
      'අවම වශයෙන් එක් ගම්මානයක් හා ගෘහ කණ්ඩායමක් එකතු කරන්න';

  @override
  String get structureEmpty =>
      'ඔබේ වසමේ ගම්මාන එකතු කරන්න. ඉන්පසු එක් එක් ගම්මානයට ගෘහ කණ්ඩායම් (උදා: 1001/01) එකතු කරන්න.';

  @override
  String supervisingValue(String name) {
    return 'සමීප අධීක්ෂණය: $name';
  }

  @override
  String leaderValue(String name) {
    return 'නායක: $name';
  }

  @override
  String landsN(int count) {
    return 'ඉඩම් $count';
  }

  @override
  String get addHouseGroup => 'ගෘහ කණ්ඩායමක් එකතු කරන්න';

  @override
  String get newVillage => 'නව ගම්මානයක්';

  @override
  String get villageNameField => 'ගම්මානයේ නම *';

  @override
  String get supervisingOfficerField => 'සමීප අධීක්ෂණ නිලධාරී';

  @override
  String get supervisingOfficerHint => 'උදා: සමෘද්ධි සංවර්ධන නිලධාරී';

  @override
  String get removeGroupsFirst => 'මුලින්ම මෙහි ගෘහ කණ්ඩායම් ඉවත් කරන්න';

  @override
  String get newHouseGroup => 'නව ගෘහ කණ්ඩායමක්';

  @override
  String get groupNoField => 'කණ්ඩායම් අංකය *';

  @override
  String get groupNoHint => 'උදා: 1001/01';

  @override
  String get groupLeaderField => 'කණ්ඩායම් නායකයා';

  @override
  String get leaderPhoneField => 'නායකයාගේ දුරකථනය';

  @override
  String get expectedLandsField => 'දළ ඉඩම් / නිවාස ගණන';

  @override
  String get expectedLandsHint => 'සමීක්ෂණ ප්‍රගතිය සඳහා';

  @override
  String groupHasLands(int count) {
    return 'මෙම කණ්ඩායමේ ඉඩම් $count ක් ඇත — ඉවත් කළ නොහැක';
  }

  @override
  String get codeNameRequired => 'වසම් අංකය හා නම අනිවාර්යයි';

  @override
  String get divisionDetails => 'වසම් තොරතුරු';

  @override
  String get setupWelcome =>
      'ආයුබෝවන්! මුලින්ම ඔබේ ග්‍රාම නිලධාරී වසමේ තොරතුරු ඇතුළත් කරන්න.';

  @override
  String get divisionNoField => 'වසම් අංකය *';

  @override
  String get divisionNoHint => 'උදා: 1001';

  @override
  String get divisionNameField => 'වසමේ නම *';

  @override
  String get divisionNameHint => 'උදා: හාරගම';

  @override
  String get dsDivisionField => 'ප්‍රාදේශීය ලේකම් කොට්ඨාසය';

  @override
  String get dsDivisionHint => 'උදා: පාතහේවාහැට';

  @override
  String get districtField => 'දිස්ත්‍රික්කය';

  @override
  String get districtHint => 'උදා: මහනුවර';

  @override
  String get gnNameField => 'ග්‍රාම නිලධාරී නම';

  @override
  String get settingsTitle => 'සැකසුම්';

  @override
  String get settingsSubtitle => 'වසම, භාෂාව, පෙනුම, ආරක්ෂාව, උපස්ථය';

  @override
  String get division => 'වසම';

  @override
  String get divisionDetailsSub => 'අංකය, නම, නිලධාරී';

  @override
  String get textSize => 'අකුරු ප්‍රමාණය';

  @override
  String get sizeNormal => 'සාමාන්‍ය';

  @override
  String get sizeLarge => 'විශාල';

  @override
  String get sizeXLarge => 'ඉතා විශාල';

  @override
  String get security => 'ආරක්ෂාව';

  @override
  String get changePin => 'PIN අංකය වෙනස් කරන්න';

  @override
  String get pinChanged => 'PIN අංකය වෙනස් කළා';

  @override
  String get biometric => 'ඇඟිලි සලකුණ / මුහුණ';

  @override
  String get biometricSub => 'PIN නැතිව විවෘත කිරීම';

  @override
  String get autoLock => 'ස්වයංක්‍රීය අගුල';

  @override
  String get lockImmediately => 'වහාම';

  @override
  String minutesN(int count) {
    return 'මිනිත්තු $count';
  }

  @override
  String get backup => 'උපස්ථය';

  @override
  String get createBackup => 'උපස්ථයක් සාදන්න';

  @override
  String get noBackupYet => 'තවම නැත — දුරකථනය නැති වුවහොත් දත්ත අහිමි වේ';

  @override
  String lastBackup(String date) {
    return 'අවසන්: $date';
  }

  @override
  String get restoreFromBackup => 'උපස්ථයෙන් ප්‍රතිස්ථාපනය';

  @override
  String get backupPassword => 'උපස්ථ මුරපදය';

  @override
  String get backupPasswordWarning =>
      'මෙම මුරපදය නැතිව උපස්ථය විවෘත කළ නොහැක. ආරක්ෂිතව මතක තබා ගන්න.';

  @override
  String get password => 'මුරපදය';

  @override
  String get passwordRepeat => 'නැවත';

  @override
  String get passwordMin => 'අවම අකුරු 6 ක්';

  @override
  String get passwordMismatch => 'මුරපද නොගැළපේ';

  @override
  String get backupShareText => 'SmartGrama සංකේතිත උපස්ථය';

  @override
  String backupFailed(String error) {
    return 'උපස්ථය අසාර්ථකයි: $error';
  }

  @override
  String get restoreConfirm =>
      'උපස්ථයෙන් ප්‍රතිස්ථාපනය කළ විට දැනට ඇති සියලු දත්ත ඉවත් වී උපස්ථයේ දත්ත පමණක් රැඳේ. ඉදිරියට යන්නද?';

  @override
  String get restoreDone => 'ප්‍රතිස්ථාපනය සාර්ථකයි';

  @override
  String restoreFailed(String error) {
    return 'ප්‍රතිස්ථාපනය අසාර්ථකයි: $error';
  }

  @override
  String get backupPasswordTooShort => 'මුරපදය අවම අකුරු 6 ක් විය යුතුය';

  @override
  String get backupWrongPassword =>
      'මුරපදය වැරදියි, නැතහොත් මෙය SmartGrama උපස්ථ ගොනුවක් නොවේ';

  @override
  String backupOtherVersion(int version) {
    return 'මෙම උපස්ථය වෙනත් අනුවාදයකින් සාදා ඇත ($version)';
  }

  @override
  String get backupNotSmartGrama => 'මෙය SmartGrama උපස්ථ ගොනුවක් නොවේ';

  @override
  String get developer => 'සංවර්ධක (debug)';

  @override
  String get addDemoData => 'ආදර්ශ දත්ත එකතු කරන්න';

  @override
  String get testingOnly => 'පරීක්ෂා කිරීමට පමණි';

  @override
  String get demoDataAdded => 'ආදර්ශ දත්ත එකතු කළා';

  @override
  String get privacyNote =>
      'සියලු දත්ත මෙම දුරකථනයේ සංකේතිතව (encrypted) ගබඩා වේ. අන්තර්ජාලයට යවන්නේ නැත.';
}
