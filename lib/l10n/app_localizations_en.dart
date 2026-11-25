// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTagline => 'Grama Niladhari division records';

  @override
  String dbOpenError(String error) {
    return 'Could not open the database.\n\n$error';
  }

  @override
  String get biometricReason => 'To unlock SmartGrama';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Save';

  @override
  String get remove => 'Remove';

  @override
  String get add => 'Add';

  @override
  String get edit => 'Edit';

  @override
  String get confirmTitle => 'Confirm';

  @override
  String get continueAction => 'Continue';

  @override
  String get other => 'Other';

  @override
  String get notes => 'Notes';

  @override
  String get note => 'Note';

  @override
  String get name => 'Name';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get phone => 'Phone';

  @override
  String get searchHint => 'Search';

  @override
  String get notFound => 'Not found';

  @override
  String get nothingHere => 'Nothing here';

  @override
  String get notSpecified => 'Not specified';

  @override
  String ageN(int age) {
    return 'Age $age';
  }

  @override
  String resultsN(int count) {
    return 'Results: $count';
  }

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusComplete => 'Complete';

  @override
  String get statusVerified => 'Verified';

  @override
  String get land => 'Land';

  @override
  String get lands => 'Lands';

  @override
  String get buildings => 'Buildings';

  @override
  String get families => 'Families';

  @override
  String get family => 'Family';

  @override
  String get persons => 'People';

  @override
  String get person => 'Person';

  @override
  String get people => 'People';

  @override
  String get trees => 'Trees';

  @override
  String get animals => 'Animals';

  @override
  String get houses => 'Houses';

  @override
  String get crops => 'Crops';

  @override
  String get photos => 'Photos';

  @override
  String get treesAndCrops => 'Trees & crops';

  @override
  String get summary => 'Summary';

  @override
  String get history => 'History';

  @override
  String get review => 'Review';

  @override
  String get population => 'Population';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get valuableTrees => 'Valuable trees';

  @override
  String get valuableTimberTrees => 'Valuable / timber trees';

  @override
  String get countedTrees => 'Counted trees';

  @override
  String get dilapidatedHouses => 'Dilapidated houses';

  @override
  String get landsWithDisputes => 'Lands with disputes';

  @override
  String get adultsWithoutNic => 'Adults without an NIC number (16+)';

  @override
  String get language => 'Language';

  @override
  String get languageChoose => 'Choose your language';

  @override
  String get languageChangeLater => 'You can change this later in Settings.';

  @override
  String get languageDataUnchanged =>
      'Only the display language changes; your data stays the same.';

  @override
  String get navHome => 'Home';

  @override
  String get navSearch => 'Search';

  @override
  String get navMap => 'Map';

  @override
  String get navReports => 'Reports';

  @override
  String get pinEnter => 'Enter your PIN';

  @override
  String get pinCreate => 'Create a new 6-digit PIN';

  @override
  String get pinConfirm => 'Enter the PIN again';

  @override
  String get pinMismatch => 'The PINs don\'t match — try again';

  @override
  String get pinLockedOut => '5 wrong attempts — wait 30 seconds';

  @override
  String get pinWrong => 'Wrong PIN';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get welcome => 'Welcome!';

  @override
  String welcomeName(String name) {
    return 'Welcome, $name';
  }

  @override
  String dashIssues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items need checking',
      one: '1 item needs checking',
    );
    return '$_temp0';
  }

  @override
  String get dashIssuesHint => 'NICs, GPS, photos, duplicates…';

  @override
  String get dashAtAGlance => 'Division at a glance';

  @override
  String dashMaleFemale(int male, int female) {
    return 'M $male • F $female';
  }

  @override
  String get dashQuickAccess => 'Quick access';

  @override
  String get dashLists => 'Lists';

  @override
  String get dashVillageProgress => 'Progress by village';

  @override
  String get dashNoVillages => 'No villages yet — add them in Settings.';

  @override
  String get dashExpectedHint =>
      'Tip: fill in \"Approx. number of lands / houses\" under Settings → Villages & house groups to show accurate progress.';

  @override
  String get surveyProgress => 'Survey progress';

  @override
  String placesDone(int done, int target) {
    return '$done of $target places complete';
  }

  @override
  String todayN(int count) {
    return 'Today $count';
  }

  @override
  String verifiedN(int count) {
    return 'Verified $count';
  }

  @override
  String get newPlaceTitle => 'Add a new place';

  @override
  String get newPlaceSub => 'Land • Buildings • Families • Trees • Animals';

  @override
  String landsSummary(int all, int done) {
    return 'Lands $all • Complete $done';
  }

  @override
  String get newPlace => 'New place';

  @override
  String get allVillages => 'All villages';

  @override
  String get allGroups => 'All groups';

  @override
  String landsEmpty(String button) {
    return 'No lands here.\nTap \"$button\" to add one.';
  }

  @override
  String get searchSubtitle => 'People, lands, buildings';

  @override
  String get searchFieldHint => 'Name, NIC, land, deed number…';

  @override
  String get searchEmptyHint =>
      'Type a name, NIC number, phone number,\nland name or deed number';

  @override
  String get searchNoResults => 'Nothing found';

  @override
  String get mapSubtitle => 'Lands, houses and valuable trees on the map';

  @override
  String mapLandCounts(int buildings, int persons, int trees, int animals) {
    return 'Buildings $buildings • People $persons • Trees $trees • Animals $animals';
  }

  @override
  String get openLand => 'Open land';

  @override
  String mapNoGps(String button) {
    return 'No lands with GPS yet. Tap \"$button\" when adding a land.';
  }

  @override
  String get reportsSubtitle => 'Statistics, lists, data checks';

  @override
  String get exportWarning =>
      'The Excel file contains all personal details (names, NIC numbers, phone numbers).\nShare it securely, for official work only.';

  @override
  String get exportAction => 'Export';

  @override
  String get statsTitle => 'Division statistics';

  @override
  String get statsHubSub => 'Population, houses, lands, trees, animals';

  @override
  String get readyListsTitle => 'Ready-made lists';

  @override
  String readyListsHubSub(int total, int withData) {
    return '$total lists • $withData with data';
  }

  @override
  String get qualityTitle => 'Data checks';

  @override
  String get qualityNoIssues => 'No issues';

  @override
  String qualityToCheckShort(int count) {
    return '$count to check';
  }

  @override
  String qualityToCheck(int count) {
    return '$count to check';
  }

  @override
  String get qualityAllGood => 'All good ✓';

  @override
  String get excelExport => 'Excel export';

  @override
  String get excelExportSub => 'All data in one file';

  @override
  String get wholeDivision => 'Whole division';

  @override
  String get statsLive => 'Live — updates automatically as you enter data';

  @override
  String awayN(int count) {
    return 'Temporarily away $count';
  }

  @override
  String get statAgeGroups => 'Age groups';

  @override
  String get statDisabled => 'Disability';

  @override
  String get statVoters => 'Voters (18+)';

  @override
  String get statHousesPermanence => 'Houses — permanence';

  @override
  String get statHousesCondition => 'Houses — condition';

  @override
  String get statToilets => 'Toilets';

  @override
  String get statAllBuildings => 'All buildings';

  @override
  String get statTotalExtent => 'Total extent';

  @override
  String get statLandsOwnership => 'Lands — ownership';

  @override
  String get statLandsUse => 'Lands — use';

  @override
  String get statTreesCounted => 'Trees (counted)';

  @override
  String get statCropsPerches => 'Crops (perches)';

  @override
  String get statCropsPlants => 'Crops (plants)';

  @override
  String get statDailyMilk => 'Daily milk production';

  @override
  String litresN(String value) {
    return '$value litres';
  }

  @override
  String get readyListsSubtitle => 'One tap — also available as Excel';

  @override
  String get rlElderly60 => 'Aged 60 and over';

  @override
  String get rlAlone70 => 'Aged 70+ living alone';

  @override
  String get rlUnder5 => 'Children aged 5 and under';

  @override
  String get rlSchool => 'Schoolchildren';

  @override
  String get rlDisabled => 'Persons with disabilities';

  @override
  String get rlAway => 'Abroad / temporarily away';

  @override
  String get rlWelfare => 'Families receiving welfare benefits';

  @override
  String get rlTempHouses => 'Temporary / semi-permanent houses';

  @override
  String get rlNoToilet => 'Houses without a toilet';

  @override
  String get rlNoPower => 'Houses without electricity';

  @override
  String get rlUnsafeWater => 'Houses without safe water';

  @override
  String get rlStateLand => 'Families on state / encroached land';

  @override
  String get rlMilk => 'Families / lands with dairy animals';

  @override
  String get rlDogs => 'Unvaccinated dogs';

  @override
  String get rlTimber => 'Lands with timber / valuable trees';

  @override
  String get rlHazardTrees => 'Hazardous trees';

  @override
  String gradeN(String grade) {
    return 'Grade $grade';
  }

  @override
  String familyOf(String name) {
    return '$name\'s family';
  }

  @override
  String get familyNoHead => 'Family (no head)';

  @override
  String milkPerDay(String value) {
    return '$value L a day';
  }

  @override
  String dogsN(int count) {
    return 'Dogs: $count';
  }

  @override
  String metresN(int value) {
    return '$value m';
  }

  @override
  String lastVerifiedYear(String year) {
    return 'Last verified $year';
  }

  @override
  String get qSameNic => 'Same NIC number for several people';

  @override
  String get qInvalidNic => 'Invalid NIC numbers';

  @override
  String get qNoDob => 'People without a date of birth';

  @override
  String get qNoGps => 'Lands without GPS';

  @override
  String get qPoorGps => 'Lands with poor GPS accuracy (10 m+)';

  @override
  String get qNoHousePhoto => 'Houses without photos';

  @override
  String get qDraft => 'Lands still in draft';

  @override
  String get qStale => 'Lands not re-verified for over a year';

  @override
  String get ckGps => 'GPS location';

  @override
  String get ckExtent => 'Land extent';

  @override
  String get ckOwner => 'Owner';

  @override
  String ckOwnerHint(String tab) {
    return 'Add the owner from the \"$tab\" tab';
  }

  @override
  String get ckNoneHintBuildings => 'If there are no buildings, tick \"none\"';

  @override
  String get ckHousePhotos => 'House photos';

  @override
  String get ckHouseFamilies => 'Families in houses';

  @override
  String ckHouseFamiliesHint(String vacant) {
    return 'If a house is empty, set its use to \"$vacant\"';
  }

  @override
  String get ckMembers => 'Family members';

  @override
  String get ckNoneHintTrees => 'If there are no trees, tick \"none\"';

  @override
  String get ckNoneHintAnimals => 'If there are no animals, tick \"none\"';

  @override
  String wGpsAccuracy(int metres) {
    return 'GPS accuracy $metres m — better to capture again';
  }

  @override
  String wTooManyTrees(String extent, int count) {
    return '$count trees on a $extent land — check the extent or the count';
  }

  @override
  String get wNoHead => 'A family has no head selected';

  @override
  String wManyHeads(int count) {
    return 'One family has $count heads';
  }

  @override
  String wOlderThanHead(String name) {
    return '$name is older than the head — check the relationship';
  }

  @override
  String wNoDob(String name) {
    return '$name — no date of birth';
  }

  @override
  String wNoNic(String name, int age) {
    return '$name — no NIC number (age $age)';
  }

  @override
  String wInvalidNic(String name) {
    return '$name — invalid NIC number';
  }

  @override
  String wDobNicMismatch(String name) {
    return '$name — date of birth doesn\'t match the NIC';
  }

  @override
  String wSameNic(String first, String second) {
    return '$first and $second — same NIC number';
  }

  @override
  String get nicEmpty => 'The NIC number is empty';

  @override
  String get nicBadFormat =>
      'Wrong format — must be 9 digits + V/X, or 12 digits';

  @override
  String get nicBadDay => 'Invalid birth-day number';

  @override
  String get nicFeb29 => 'February 29 — not a leap year';

  @override
  String get nicFuture => 'Date of birth is in the future';

  @override
  String get nicBadYear => 'Invalid birth year';

  @override
  String extentAcres(String value) {
    return 'A $value';
  }

  @override
  String extentRoods(String value) {
    return 'R $value';
  }

  @override
  String extentPerches(String value) {
    return 'P $value';
  }

  @override
  String extentHectares(String value) {
    return '$value ha';
  }

  @override
  String get unitArp => 'A-R-P';

  @override
  String get unitAcres => 'Acres';

  @override
  String get unitRoods => 'Roods';

  @override
  String get unitPerches => 'Perches';

  @override
  String get unitHectares => 'Hectares';

  @override
  String get fVillage => 'Village';

  @override
  String get fHouseGroup => 'House group';

  @override
  String get fLandName => 'Land name';

  @override
  String get fAddress => 'Address';

  @override
  String get fExtentPerches => 'Extent (perches)';

  @override
  String get fExtent => 'Extent';

  @override
  String get fOwnership => 'Ownership';

  @override
  String get fOwners => 'Owners';

  @override
  String get fDeedNo => 'Deed no.';

  @override
  String get fDeedPermitNo => 'Deed / permit no.';

  @override
  String get fPlanNo => 'Plan no.';

  @override
  String get fLotNo => 'Lot no.';

  @override
  String get fPlanLotNo => 'Plan / lot no.';

  @override
  String get fScheme => 'Settlement scheme';

  @override
  String get fUse => 'Use';

  @override
  String get fSubdivision => 'Subdivision';

  @override
  String get fNorth => 'North';

  @override
  String get fEast => 'East';

  @override
  String get fSouth => 'South';

  @override
  String get fWest => 'West';

  @override
  String get fDispute => 'Dispute';

  @override
  String get fLatitude => 'Latitude';

  @override
  String get fLongitude => 'Longitude';

  @override
  String get fGpsAccuracyM => 'GPS accuracy (m)';

  @override
  String get fStatus => 'Status';

  @override
  String get fVerifiedOn => 'Verified on';

  @override
  String get fVerified => 'Verified';

  @override
  String get fType => 'Type';

  @override
  String get fNumber => 'No.';

  @override
  String get fFloors => 'Floors';

  @override
  String get fSqft => 'Sq. ft';

  @override
  String get fRooms => 'Rooms';

  @override
  String get fYearBuilt => 'Year built';

  @override
  String get fWater => 'Water';

  @override
  String get fApproval => 'Approval';

  @override
  String get fHead => 'Head';

  @override
  String get fMembers => 'Members';

  @override
  String get fIncomeSource => 'Income source';

  @override
  String get fFuel => 'Fuel';

  @override
  String get fWelfare => 'Welfare';

  @override
  String get fSinceYear => 'Resident since';

  @override
  String get fFullName => 'Full name';

  @override
  String get fNameWithInitials => 'Name with initials';

  @override
  String get fNic => 'NIC';

  @override
  String get fDob => 'Date of birth';

  @override
  String get fAge => 'Age';

  @override
  String get fSex => 'Sex';

  @override
  String get fRelation => 'Relationship';

  @override
  String get fGrade => 'Grade';

  @override
  String get fWorkplace => 'Workplace';

  @override
  String get fVoter => 'Voter';

  @override
  String get fIllnesses => 'Illnesses';

  @override
  String get fBearing => 'Bearing';

  @override
  String get fYoungTrees => 'Young';

  @override
  String get fTotal => 'Total';

  @override
  String get fGirthIn => 'Girth (in)';

  @override
  String get fHeightFt => 'Height (ft)';

  @override
  String get fHazardous => 'Hazardous';

  @override
  String get fCrop => 'Crop';

  @override
  String get fAmount => 'Amount';

  @override
  String get fMaleAnimals => 'Male';

  @override
  String get fFemaleAnimals => 'Female';

  @override
  String get fYoungAnimals => 'Young';

  @override
  String get fMilkPerDay => 'Milk (L/day)';

  @override
  String get fVaccinated => 'Vaccinated';

  @override
  String get fLastVaccination => 'Last vaccination';

  @override
  String get fDetails => 'Details';

  @override
  String get sheetPeople => 'People';

  @override
  String get sheetTreesCounted => 'Trees (counted)';

  @override
  String get sheetList => 'List';

  @override
  String get landNew => 'New land';

  @override
  String get landEdit => 'Edit land';

  @override
  String get landNameRequired => 'The land name is required';

  @override
  String get selectHouseGroup => 'Select a house group';

  @override
  String get extentInvalid => 'The land extent is not valid';

  @override
  String arpOddConfirm(String extent) {
    return 'A value is 4 roods or 40 perches or more. Save the total extent as $extent?';
  }

  @override
  String deedDupConfirm(String deed, String land) {
    return 'Deed number \"$deed\" is already recorded for the land \"$land\". Save anyway?';
  }

  @override
  String get villageGroupField => 'Village / house group *';

  @override
  String get landNameField => 'Land name *';

  @override
  String get landNameHint => 'e.g. Koswatta';

  @override
  String get addressField => 'Address / location description';

  @override
  String get subdivisionAllowed => 'Subdivision allowed';

  @override
  String ownersAddLater(String section) {
    return 'After saving the land, add owners and occupants in the \"$section\" section.';
  }

  @override
  String get boundaries => 'Boundaries';

  @override
  String get hasDispute => 'There is a dispute';

  @override
  String get disputeNote => 'Dispute details';

  @override
  String get otherNotes => 'Other notes';

  @override
  String get disputeExists => 'Yes';

  @override
  String get gpsNotTaken => 'GPS location not captured';

  @override
  String gpsAccuracyPoor(int metres) {
    return 'Accuracy $metres m — poor, capture again';
  }

  @override
  String gpsAccuracy(int metres) {
    return 'Accuracy $metres m';
  }

  @override
  String get gpsRetake => 'Retake';

  @override
  String get gpsTake => 'Get GPS';

  @override
  String get gpsServiceOff => 'Turn on the phone\'s Location (GPS)';

  @override
  String get gpsDenied =>
      'No permission to get the location — allow it in Settings';

  @override
  String get gpsFailed => 'Couldn\'t get GPS — go into the open and try again';

  @override
  String photoFailed(String error) {
    return 'Couldn\'t take the photo: $error';
  }

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get photoDeleteConfirm => 'Remove this photo?';

  @override
  String get newItem => 'New item';

  @override
  String get addNewItem => 'Add a new item';

  @override
  String get pickLists => 'Pick lists';

  @override
  String get pickListsSub => 'Add types of trees, animals, crops and more';

  @override
  String itemsN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get addedByYou => 'Added by you';

  @override
  String get shown => 'Shown';

  @override
  String get hidden => 'Hidden';

  @override
  String get customItemsNote =>
      'Items you add show with the same name in every language.';

  @override
  String get landNotFound => 'Land not found';

  @override
  String get landRemoved => 'This land has been removed';

  @override
  String get stepByStep => 'Step by step';

  @override
  String get landDeleteConfirm =>
      'Remove this land and all its buildings, families, trees and animals?\n(Only if it was entered by mistake. It stays in the history.)';

  @override
  String get landDelete => 'Remove land';

  @override
  String percentComplete(int percent) {
    return '$percent% complete';
  }

  @override
  String get forCompleteness => 'For completeness';

  @override
  String get onThisLand => 'On this land';

  @override
  String get completeness => 'Information completeness';

  @override
  String get allSectionsComplete => 'All sections complete 🎉';

  @override
  String sectionsDone(int done, int total, String missing) {
    return '$done of $total sections complete.\nRemaining: $missing';
  }

  @override
  String nicDupElsewhere(String nic, String name) {
    return '$nic — also recorded elsewhere as $name (duplicate?)';
  }

  @override
  String pleaseCheckN(int count) {
    return 'Please check ($count)';
  }

  @override
  String markCompleteConfirm(int count, String status) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sections are',
      one: '1 section is',
    );
    return '$_temp0 still incomplete. Mark as \"$status\"?';
  }

  @override
  String get markComplete => 'Complete';

  @override
  String get verify => 'Verify';

  @override
  String get backToDraft => 'Back to draft';

  @override
  String get landDetails => 'Land details';

  @override
  String get noBuildingsOnLand => 'No buildings on this land';

  @override
  String roomsN(int count) {
    return 'Rooms $count';
  }

  @override
  String familiesN(int count) {
    return 'Families $count';
  }

  @override
  String get noPhotosWarning => '⚠ No photos';

  @override
  String get addHouseFirstConfirm =>
      'To add a family, first add a house. Add a house now?';

  @override
  String get landParties => 'People linked to the land';

  @override
  String get landPartiesHint => 'Add owners, occupants, heirs and others here.';

  @override
  String shareN(String share) {
    return 'Share $share';
  }

  @override
  String get outsideDivision => 'Outside the division';

  @override
  String get addFamilyButton => 'Family';

  @override
  String get addMember => 'Add a member';

  @override
  String noFamiliesYet(String button) {
    return 'No families added yet. Tap the \"$button\" button.';
  }

  @override
  String get countAction => 'Count';

  @override
  String bearingYoung(int bearing, int young) {
    return 'Bearing $bearing • Young $young';
  }

  @override
  String get singleTree => 'Single tree';

  @override
  String girthInN(String value) {
    return 'Girth $value in';
  }

  @override
  String heightFtN(String value) {
    return 'Height $value ft';
  }

  @override
  String get hazardWarning => '⚠ Hazardous';

  @override
  String get addCropButton => 'Crop';

  @override
  String get noTreesOnLand => 'No trees / crops on this land';

  @override
  String animalCountsShort(int male, int female, int young) {
    return 'M $male • F $female • Y $young';
  }

  @override
  String milkLitresPerDay(String value) {
    return 'Milk $value L/day';
  }

  @override
  String vaccinatedValue(String value) {
    return 'Vaccinated: $value';
  }

  @override
  String get noAnimalsOnLand => 'No animals on this land';

  @override
  String get landPhotos => 'Land photos';

  @override
  String get otherPhotos => 'Building / tree photos';

  @override
  String get noHistory => 'No history';

  @override
  String get entLandParty => 'Person linked to land';

  @override
  String get entBuilding => 'Building';

  @override
  String get entResidenceEvent => 'Residence change';

  @override
  String get entTree => 'Single tree';

  @override
  String get entCrop => 'Crop';

  @override
  String get entPhoto => 'Photo';

  @override
  String get actCreate => 'Added';

  @override
  String get actUpdate => 'Changed';

  @override
  String get actDelete => 'Removed';

  @override
  String stepOf(int step, int total, String name) {
    return 'Step $step of $total — $name';
  }

  @override
  String get back => 'Back';

  @override
  String nextStep(String name) {
    return 'Next: $name';
  }

  @override
  String get finish => 'Finish';

  @override
  String get nextPlace => 'Next place';

  @override
  String get evArrived => 'Moved in';

  @override
  String get evLeft => 'Moved out';

  @override
  String get evBirth => 'Birth';

  @override
  String get evDeath => 'Death';

  @override
  String get evAway => 'Went away temporarily';

  @override
  String get evReturned => 'Returned';

  @override
  String nicDerived(String dob, String sex) {
    return 'Date of birth $dob • $sex — from the NIC';
  }

  @override
  String get nameRequired => 'The name is required';

  @override
  String nicInvalidConfirm(String error) {
    return 'The NIC number is not valid ($error). Save anyway?';
  }

  @override
  String get dobMismatchConfirm =>
      'The date of birth entered doesn\'t match the NIC. Save anyway?';

  @override
  String nicDupConfirm(String names) {
    return 'This NIC number is already in the register: $names\n\nCheck whether the same person has been entered twice. Save anyway?';
  }

  @override
  String nicLaterNote(int age) {
    return 'Note: age $age — add the NIC number later';
  }

  @override
  String twoHeadsConfirm(String name) {
    return '$name is already the head. The family would have two heads. Save anyway?';
  }

  @override
  String olderThanHeadConfirm(String name) {
    return 'This person is older than the head ($name). Is the relationship correct?';
  }

  @override
  String get newMember => 'New member';

  @override
  String get removeIfMistake => 'Remove if entered by mistake';

  @override
  String personDeleteConfirm(String field) {
    return 'Only remove if entered by mistake.\nIf the person moved away or died, change \"$field\" instead.\n\nRemove?';
  }

  @override
  String get fullNameField => 'Full name *';

  @override
  String get nicField => 'National Identity Card number';

  @override
  String get eduAndWork => 'Education & employment';

  @override
  String get gradeSchoolField => 'Grade / school';

  @override
  String get healthOther => 'Health & other';

  @override
  String get chronicIllnessField => 'Chronic illnesses (optional)';

  @override
  String get isVoterField => 'Registered voter?';

  @override
  String statusChangedOn(String date) {
    return 'Date of change: $date';
  }

  @override
  String get nameOrNicHint => 'Name or NIC number';

  @override
  String get pickFromRegister => 'Choose from the register';

  @override
  String get pickFromRegisterSub => 'If they live in the division';

  @override
  String get outsideNameField => 'Or name (if they live outside the division)';

  @override
  String get shareField => 'Share (optional)';

  @override
  String get shareHint => 'e.g. 1/2';

  @override
  String get pickPersonOrName => 'Choose a person or enter a name';

  @override
  String get nicCard => 'National Identity Card';

  @override
  String get nicInvalidNumber => '⚠ Invalid number';

  @override
  String get personalDetails => 'Personal details';

  @override
  String get livesAt => 'Lives at';

  @override
  String get otherFamilyMembers => 'Other family members';

  @override
  String get linkedLands => 'Linked lands';

  @override
  String get residenceHistory => 'Residence history';

  @override
  String get selectBuildingType => 'Select the building type';

  @override
  String get yearBuiltInvalid => 'The year built is not valid';

  @override
  String get newBuilding => 'New building';

  @override
  String get buildingDeleteConfirm =>
      'Remove this building and the families living in it? (It stays in the history)';

  @override
  String get buildingNoField => 'House / building no.';

  @override
  String get buildingNoHint => 'Pradeshiya Sabha number, if any';

  @override
  String get floorsField => 'Number of floors';

  @override
  String get floorAreaField => 'Floor area (sq. ft)';

  @override
  String get roomsField => 'Number of rooms';

  @override
  String get materials => 'Construction materials';

  @override
  String get yearBuiltField => 'Year built (approx.)';

  @override
  String get facilities => 'Facilities';

  @override
  String get buildingApproval => 'Building approval';

  @override
  String get housePhotoRequired =>
      'A photo of the front of the house is required.';

  @override
  String get selectFamilyHouse => 'Select the house the family lives in';

  @override
  String get sinceYearInvalid => 'The year they moved in is not valid';

  @override
  String get newFamily => 'New family';

  @override
  String get familyDetails => 'Family details';

  @override
  String get familyDeleteConfirm =>
      'Remove this family and its members? (It stays in the history)';

  @override
  String get livingBuildingField => 'Building they live in *';

  @override
  String get sinceYearField => 'Year they moved in';

  @override
  String treeCountTitle(int count) {
    return 'Tree count ($count)';
  }

  @override
  String get youngNotBearing => 'Young / not bearing';

  @override
  String get addSpecies => 'Add a species';

  @override
  String get otherSpecies => 'Other species';

  @override
  String timberHint(String button) {
    return 'Add valuable timber trees such as teak and mahogany separately as a \"$button\", with the girth.';
  }

  @override
  String get selectTreeSpecies => 'Select the tree species';

  @override
  String get girthInvalid => 'The girth (inches) is not valid';

  @override
  String get treeDeleteConfirm =>
      'Remove this tree? (If it was cut down, also leave a note)';

  @override
  String get girthField => 'Girth at breast height (inches)';

  @override
  String get girthHint => '4½ ft above the ground';

  @override
  String get heightField => 'Approx. height (ft)';

  @override
  String get treeAgeField => 'Approx. age (years)';

  @override
  String get hazardousField => 'Hazardous';

  @override
  String get hazardousHint => 'Could fall on a house / power line';

  @override
  String get selectCrop => 'Select the crop';

  @override
  String get newCrop => 'New crop';

  @override
  String get cropDeleteConfirm => 'Remove this crop?';

  @override
  String get selectAnimal => 'Select the animal type';

  @override
  String get enterCount => 'Enter the count';

  @override
  String milkPerAnimalConfirm(String litres) {
    return '$litres litres of milk per animal per day — is that correct?';
  }

  @override
  String get addAnimals => 'Add animals';

  @override
  String get recordDeleteConfirm => 'Remove this record?';

  @override
  String get dailyMilkField => 'Daily milk (litres)';

  @override
  String get rabiesVaccinated => 'Vaccinated against rabies?';

  @override
  String get vaccinatedQuestion => 'Vaccinated?';

  @override
  String get lastVaccinationDate => 'Last vaccination date';

  @override
  String lastVaccinationOn(String date) {
    return 'Last vaccination: $date';
  }

  @override
  String get ownerFamily => 'Owner family';

  @override
  String get villagesAndGroups => 'Villages & house groups';

  @override
  String get addVillageButton => 'Village';

  @override
  String get needOneGroup => 'Add at least one village and one house group';

  @override
  String get structureEmpty =>
      'Add the villages in your division. Then add house groups (e.g. 1001/01) to each village.';

  @override
  String supervisingValue(String name) {
    return 'Supervising officer: $name';
  }

  @override
  String leaderValue(String name) {
    return 'Leader: $name';
  }

  @override
  String landsN(int count) {
    return 'Lands $count';
  }

  @override
  String get addHouseGroup => 'Add a house group';

  @override
  String get newVillage => 'New village';

  @override
  String get villageNameField => 'Village name *';

  @override
  String get supervisingOfficerField => 'Supervising officer';

  @override
  String get supervisingOfficerHint => 'e.g. Samurdhi Development Officer';

  @override
  String get removeGroupsFirst => 'Remove the house groups here first';

  @override
  String get newHouseGroup => 'New house group';

  @override
  String get groupNoField => 'Group number *';

  @override
  String get groupNoHint => 'e.g. 1001/01';

  @override
  String get groupLeaderField => 'Group leader';

  @override
  String get leaderPhoneField => 'Leader\'s phone';

  @override
  String get expectedLandsField => 'Approx. number of lands / houses';

  @override
  String get expectedLandsHint => 'For survey progress';

  @override
  String groupHasLands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lands',
      one: '1 land',
    );
    return 'This group has $_temp0 — it cannot be removed';
  }

  @override
  String get codeNameRequired => 'The division number and name are required';

  @override
  String get divisionDetails => 'Division details';

  @override
  String get setupWelcome =>
      'Welcome! First, enter the details of your Grama Niladhari division.';

  @override
  String get divisionNoField => 'Division number *';

  @override
  String get divisionNoHint => 'e.g. 1001';

  @override
  String get divisionNameField => 'Division name *';

  @override
  String get divisionNameHint => 'e.g. Haragama';

  @override
  String get dsDivisionField => 'Divisional Secretariat division';

  @override
  String get dsDivisionHint => 'e.g. Pathahewaheta';

  @override
  String get districtField => 'District';

  @override
  String get districtHint => 'e.g. Kandy';

  @override
  String get gnNameField => 'Grama Niladhari name';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSubtitle =>
      'Division, language, appearance, security, backup';

  @override
  String get division => 'Division';

  @override
  String get divisionDetailsSub => 'Number, name, officer';

  @override
  String get textSize => 'Text size';

  @override
  String get sizeNormal => 'Normal';

  @override
  String get sizeLarge => 'Large';

  @override
  String get sizeXLarge => 'Very large';

  @override
  String get security => 'Security';

  @override
  String get changePin => 'Change PIN';

  @override
  String get pinChanged => 'PIN changed';

  @override
  String get biometric => 'Fingerprint / face';

  @override
  String get biometricSub => 'Unlock without the PIN';

  @override
  String get autoLock => 'Auto-lock';

  @override
  String get lockImmediately => 'Immediately';

  @override
  String minutesN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get backup => 'Backup';

  @override
  String get createBackup => 'Create a backup';

  @override
  String get noBackupYet => 'None yet — data will be lost if the phone is lost';

  @override
  String lastBackup(String date) {
    return 'Last: $date';
  }

  @override
  String get restoreFromBackup => 'Restore from backup';

  @override
  String get backupPassword => 'Backup password';

  @override
  String get backupPasswordWarning =>
      'The backup can\'t be opened without this password. Keep it safe.';

  @override
  String get password => 'Password';

  @override
  String get passwordRepeat => 'Repeat password';

  @override
  String get passwordMin => 'At least 6 characters';

  @override
  String get passwordMismatch => 'The passwords don\'t match';

  @override
  String get backupShareText => 'SmartGrama encrypted backup';

  @override
  String backupFailed(String error) {
    return 'Backup failed: $error';
  }

  @override
  String get restoreConfirm =>
      'Restoring removes all current data and keeps only the data in the backup. Continue?';

  @override
  String get restoreDone => 'Restore successful';

  @override
  String restoreFailed(String error) {
    return 'Restore failed: $error';
  }

  @override
  String get backupPasswordTooShort =>
      'The password must be at least 6 characters';

  @override
  String get backupWrongPassword =>
      'Wrong password, or this is not a SmartGrama backup file';

  @override
  String backupOtherVersion(int version) {
    return 'This backup was made with a different version ($version)';
  }

  @override
  String get backupNotSmartGrama => 'This is not a SmartGrama backup file';

  @override
  String get developer => 'Developer (debug)';

  @override
  String get addDemoData => 'Add demo data';

  @override
  String get testingOnly => 'For testing only';

  @override
  String get demoDataAdded => 'Demo data added';

  @override
  String get privacyNote =>
      'All data is stored encrypted on this phone. Nothing is sent to the internet.';
}
