/// Pick lists ("තේරීම් ලැයිස්තු" / "Pick lists" / "தெரிவுப் பட்டியல்கள்").
///
/// Values are stored in the database as stable [PickOption.code]s and the
/// label is looked up at display time in the current language (Sinhala,
/// English or Tamil). This keeps counts accurate ("පොල්" / "Coconut" /
/// "தென்னை" are always `coconut`) and lets the language change without
/// touching the data.
///
/// The officer can add extra options per list; those live in the
/// `pick_items` table, have one label typed by the officer (shown as-is in
/// every language) and are merged in by [PickRegistry].
library;

import '../l10n/l10n.dart';

/// A text in the app's three languages.
class Tri {
  const Tri(this.si, this.en, this.ta);
  final String si, en, ta;

  String get text => inLang(L10n.lang.value);

  String inLang(AppLang l) => switch (l) {
        AppLang.si => si,
        AppLang.en => en,
        AppLang.ta => ta,
      };

  /// Case-insensitive match against any of the three languages, so a
  /// search typed in one language still finds the option.
  bool matches(String query) {
    final q = query.toLowerCase();
    return si.toLowerCase().contains(q) || en.toLowerCase().contains(q) || ta.toLowerCase().contains(q);
  }
}

class PickOption {
  const PickOption(this.code, this.si, this.en, this.ta);

  /// Officer-added option: the same label in every language.
  const PickOption.custom(this.code, String label)
      : si = label,
        en = label,
        ta = label;

  final String code;
  final String si, en, ta;

  Tri get names => Tri(si, en, ta);

  /// Label in the current language.
  String get label => names.text;
}

class PickListDef {
  const PickListDef(this.name, this.titles, this.options, {this.editable = true});
  final String name;
  final Tri titles;
  final List<PickOption> options;

  /// Whether the officer may add custom options to this list.
  final bool editable;

  /// Title in the current language.
  String get title => titles.text;
}

const unknown = PickOption('unknown', 'නොදනී', 'Unknown', 'தெரியாது');
const _other = PickOption('other', 'වෙනත්', 'Other', 'வேறு');
const _none = PickOption('none', 'නැත', 'None', 'இல்லை');

/// Every pick list used by the app, keyed by [PickListDef.name].
class PL {
  static const landUse = 'land_use';
  static const ownership = 'ownership';
  static const extentSource = 'extent_source';
  static const partyRole = 'party_role';
  static const yesNoUnknown = 'yes_no_unknown';
  static const infoSource = 'info_source';

  static const buildingType = 'building_type';
  static const wall = 'wall';
  static const roof = 'roof';
  static const floor = 'floor';
  static const permanence = 'permanence';
  static const condition = 'condition';
  static const buildingUsage = 'building_usage';
  static const electricity = 'electricity';
  static const water = 'water';
  static const toilet = 'toilet';

  static const tenure = 'tenure';
  static const incomeRange = 'income_range';
  static const incomeSource = 'income_source';
  static const cookingFuel = 'cooking_fuel';
  static const welfare = 'welfare';

  static const gender = 'gender';
  static const relation = 'relation';
  static const ethnicity = 'ethnicity';
  static const religion = 'religion';
  static const civilStatus = 'civil_status';
  static const education = 'education';
  static const occupation = 'occupation';
  static const disability = 'disability';
  static const personStatus = 'person_status';

  static const treeCountSpecies = 'tree_count_species';
  static const treeSingleSpecies = 'tree_single_species';
  static const treeCondition = 'tree_condition';
  static const crop = 'crop';
  static const cropUnit = 'crop_unit';
  static const season = 'season';
  static const irrigation = 'irrigation';
  static const cultivator = 'cultivator';

  static const animal = 'animal';
  static const animalPurpose = 'animal_purpose';
  static const animalHousing = 'animal_housing';
}

const List<PickListDef> pickListDefs = [
  // ---------------- ඉඩම / Land / காணி ----------------
  PickListDef(PL.landUse, Tri('ඉඩම් භාවිතය', 'Land use', 'காணிப் பயன்பாடு'), [
    PickOption('home_garden', 'ගෙවත්ත', 'Home garden', 'வீட்டுத்தோட்டம்'),
    PickOption('paddy', 'කුඹුර', 'Paddy field', 'வயல்'),
    PickOption('tea', 'තේ', 'Tea', 'தேயிலை'),
    PickOption('coconut', 'පොල්', 'Coconut', 'தென்னை'),
    PickOption('rubber', 'රබර්', 'Rubber', 'இறப்பர்'),
    PickOption('chena', 'හේන', 'Chena', 'சேனை'),
    PickOption('mixed', 'මිශ්‍ර වගාව', 'Mixed cultivation', 'கலப்புப் பயிர்ச்செய்கை'),
    PickOption('vegetable', 'එළවළු', 'Vegetables', 'மரக்கறி'),
    PickOption('bare', 'හිස් ඉඩම', 'Bare land', 'வெற்றுக் காணி'),
    PickOption('commercial', 'වාණිජ', 'Commercial', 'வர்த்தகம்'),
    PickOption('religious', 'ආගමික', 'Religious', 'மதத் தலம்'),
    PickOption('forest', 'කැලෑ / රක්ෂිත', 'Forest / reserve', 'காடு / ஒதுக்கம்'),
    PickOption('water_body', 'ජලාශ', 'Water body', 'நீர்நிலை'),
    _other,
  ]),
  PickListDef(PL.ownership, Tri('අයිතියේ වර්ගය', 'Ownership type', 'உரிமை வகை'), [
    PickOption('private_deed', 'පෞද්ගලික ඔප්පු', 'Private (deed)', 'தனியார் (உறுதி)'),
    PickOption('state_permit', 'රජයේ බලපත්‍ර', 'State permit', 'அரச அனுமதிப்பத்திரம்'),
    PickOption('jaya_bhoomi', 'ජය භූමි ප්‍රදාන', 'Jaya Bhoomi grant', 'ஜய பூமி அளிப்பு'),
    PickOption('swarna_bhoomi', 'ස්වර්ණ භූමි ප්‍රදාන', 'Swarna Bhoomi grant', 'ஸ்வர்ண பூமி அளிப்பு'),
    PickOption('lrc', 'ඉඩම් ප්‍රතිසංස්කරණ කොමිෂන් (LRC)', 'Land Reform Commission (LRC)',
        'காணிச் சீர்திருத்த ஆணைக்குழு (LRC)'),
    PickOption('temple', 'පන්සල් / දේවාල', 'Temple / devale', 'விகாரை / தேவாலயம்'),
    PickOption('state', 'රජයේ ඉඩම', 'State land', 'அரச காணி'),
    PickOption('reserve', 'රක්ෂිත', 'Reserve', 'ஒதுக்கக் காணி'),
    PickOption('lease', 'බදු', 'Lease', 'குத்தகை'),
    PickOption('encroached', 'අනවසර', 'Encroached', 'அனுமதியற்றது'),
    PickOption('disputed', 'ආරවුලක', 'Under dispute', 'பிணக்கில் உள்ளது'),
    unknown,
  ]),
  PickListDef(PL.extentSource, Tri('ප්‍රමාණයේ මූලාශ්‍රය', 'Source of extent', 'பரப்பளவின் மூலம்'), [
    PickOption('deed', 'ඔප්පුව', 'Deed', 'உறுதி'),
    PickOption('plan', 'පිඹුර', 'Survey plan', 'நில அளவை வரைபடம்'),
    PickOption('estimate', 'ඇස්තමේන්තු', 'Estimate', 'மதிப்பீடு'),
    PickOption('gps', 'GPS මැනීම', 'GPS measurement', 'GPS அளவீடு'),
  ], editable: false),
  PickListDef(PL.partyRole, Tri('ඉඩමට සම්බන්ධතාව', 'Relationship to land', 'காணியுடனான தொடர்பு'), [
    PickOption('owner', 'අයිතිකරු', 'Owner', 'உரிமையாளர்'),
    PickOption('occupant', 'පදිංචිකරු / භුක්තිය', 'Occupant / possessor', 'குடியிருப்பாளர் / அனுபவிப்பவர்'),
    PickOption('heir', 'උරුමකරු', 'Heir', 'வாரிசு'),
    PickOption('lessee', 'බදුකරු', 'Lessee', 'குத்தகைதாரர்'),
    PickOption('tenant_farmer', 'අඳ ගොවියා', 'Tenant cultivator (ande)', 'குத்தகைப் பயிர்ச்செய்கையாளர்'),
  ], editable: false),
  PickListDef(PL.yesNoUnknown, Tri('ඔව් / නැත', 'Yes / no', 'ஆம் / இல்லை'), [
    PickOption('yes', 'ඔව්', 'Yes', 'ஆம்'),
    PickOption('no', 'නැත', 'No', 'இல்லை'),
    unknown,
  ], editable: false),
  PickListDef(PL.infoSource, Tri('තොරතුරු මූලාශ්‍රය', 'Source of information', 'தகவல் மூலம்'), [
    PickOption('observed', 'ස්ථානයට ගොස් නිරීක්ෂණය', 'Observed on site', 'இடத்திற்குச் சென்று அவதானித்தது'),
    PickOption('told', 'පවුලේ සාමාජිකයා පැවසීම', 'Told by a family member', 'குடும்ப உறுப்பினர் கூறியது'),
    PickOption('document', 'ලේඛනයෙන් (ඔප්පුව, හැඳුනුම්පත)', 'From a document (deed, NIC)',
        'ஆவணத்திலிருந்து (உறுதி, அடையாள அட்டை)'),
    PickOption('old_register', 'පැරණි ගෘහ ලේඛනයෙන්', 'From the old household register',
        'பழைய வீட்டுப் பதிவேட்டிலிருந்து'),
  ], editable: false),

  // ---------------- ගොඩනැගිලි / Buildings / கட்டடங்கள் ----------------
  PickListDef(PL.buildingType, Tri('ගොඩනැගිලි වර්ගය', 'Building type', 'கட்டட வகை'), [
    PickOption('house', 'නිවස', 'House', 'வீடு'),
    PickOption('shop', 'කඩය', 'Shop', 'கடை'),
    PickOption('store', 'ගබඩාව', 'Store', 'களஞ்சியம்'),
    PickOption('cattle_shed', 'ගව මඩුව', 'Cattle shed', 'மாட்டுக் கொட்டில்'),
    PickOption('poultry_house', 'කුකුළු කූඩුව', 'Poultry house', 'கோழிக் கூடு'),
    PickOption('pig_sty', 'ඌරු කොටුව', 'Pigsty', 'பன்றிக் கொட்டில்'),
    PickOption('toilet', 'වැසිකිළිය', 'Toilet', 'மலசலகூடம்'),
    PickOption('well', 'ළිඳ', 'Well', 'கிணறு'),
    PickOption('garage', 'වාහන ගාල', 'Garage', 'வாகனத் தரிப்பிடம்'),
    PickOption('industry', 'කර්මාන්ත ස්ථානය', 'Industrial workshop', 'கைத்தொழில் நிலையம்'),
    PickOption('religious', 'ආගමික ගොඩනැගිල්ල', 'Religious building', 'மதக் கட்டடம்'),
    PickOption('school', 'පාසල', 'School', 'பாடசாலை'),
    PickOption('community_hall', 'ප්‍රජා ශාලාව', 'Community hall', 'சமூக மண்டபம்'),
    PickOption('unfinished', 'නොනිමි ගොඩනැගිල්ල', 'Unfinished building', 'பூர்த்தியடையாத கட்டடம்'),
    _other,
  ]),
  PickListDef(PL.wall, Tri('බිත්ති', 'Walls', 'சுவர்கள்'), [
    PickOption('brick', 'ගඩොල්', 'Brick', 'செங்கல்'),
    PickOption('cement_block', 'සිමෙන්ති බ්ලොක්', 'Cement block', 'சீமெந்துக் கல்'),
    PickOption('cabook', 'කබොක්', 'Cabook', 'கபுக்'),
    PickOption('mud', 'මැටි', 'Mud', 'களிமண்'),
    PickOption('wood', 'ලෑලි', 'Wooden planks', 'மரப்பலகை'),
    PickOption('metal_sheet', 'ටකරන්', 'Metal sheet', 'தகரம்'),
    _other,
  ]),
  PickListDef(PL.roof, Tri('වහලය', 'Roof', 'கூரை'), [
    PickOption('tile', 'උළු', 'Tile', 'ஓடு'),
    PickOption('asbestos', 'ඇස්බැස්ටෝස්', 'Asbestos', 'அஸ்பெஸ்டோஸ்'),
    PickOption('metal_sheet', 'ටකරන්', 'Metal sheet', 'தகரம்'),
    PickOption('concrete', 'කොන්ක්‍රීට්', 'Concrete', 'கொங்கிறீற்'),
    PickOption('cadjan', 'පොල් අතු / පිදුරු', 'Cadjan / straw', 'கிடுகு / வைக்கோல்'),
    _other,
  ]),
  PickListDef(PL.floor, Tri('පොළොව', 'Floor', 'தரை'), [
    PickOption('tile', 'ටයිල්', 'Floor tiles', 'தரை ஓடு'),
    PickOption('cement', 'සිමෙන්ති', 'Cement', 'சீமெந்து'),
    PickOption('terrazzo', 'ටෙරාසෝ', 'Terrazzo', 'டெரசோ'),
    PickOption('mud', 'මැටි', 'Mud', 'களிமண்'),
    _other,
  ]),
  PickListDef(PL.permanence, Tri('ස්ථිරභාවය', 'Permanence', 'நிரந்தரத்தன்மை'), [
    PickOption('permanent', 'ස්ථිර', 'Permanent', 'நிரந்தரம்'),
    PickOption('semi', 'අර්ධ ස්ථිර', 'Semi-permanent', 'அரை நிரந்தரம்'),
    PickOption('temporary', 'තාවකාලික', 'Temporary', 'தற்காலிகம்'),
  ], editable: false),
  PickListDef(PL.condition, Tri('තත්ත්වය', 'Condition', 'நிலைமை'), [
    PickOption('good', 'හොඳයි', 'Good', 'நன்று'),
    PickOption('fair', 'සාමාන්‍යයි', 'Fair', 'சாதாரணம்'),
    PickOption('poor', 'අබලන්', 'Dilapidated', 'சிதைவடைந்தது'),
    PickOption('unusable', 'භාවිතයට නුසුදුසුයි', 'Unfit for use', 'பயன்படுத்தத் தகுதியற்றது'),
  ], editable: false),
  PickListDef(PL.buildingUsage, Tri('භාවිතය', 'Use', 'பயன்பாடு'), [
    PickOption('residence', 'වාසය', 'Residence', 'குடியிருப்பு'),
    PickOption('commercial', 'වාණිජ', 'Commercial', 'வர்த்தகம்'),
    PickOption('mixed', 'මිශ්‍ර', 'Mixed', 'கலப்பு'),
    PickOption('vacant', 'හිස්', 'Vacant', 'வெறுமை'),
    PickOption('rented', 'කුලියට', 'Rented out', 'வாடகைக்கு'),
    _other,
  ]),
  PickListDef(PL.electricity, Tri('විදුලිය', 'Electricity', 'மின்சாரம்'), [
    PickOption('grid', 'ජාතික ජාලය', 'National grid', 'தேசிய மின்கட்டமைப்பு'),
    PickOption('solar', 'සූර්ය', 'Solar', 'சூரிய சக்தி'),
    _none,
  ]),
  PickListDef(PL.water, Tri('ජල මූලාශ්‍රය', 'Water source', 'நீர் மூலம்'), [
    PickOption('pipe_national', 'නළ ජලය (ජාතික)', 'Pipe-borne (national)', 'குழாய் நீர் (தேசிய)'),
    PickOption('pipe_community', 'ප්‍රජා ජල ව්‍යාපෘතිය', 'Community water project', 'சமூக நீர் வழங்கல் திட்டம்'),
    PickOption('protected_well', 'ආරක්ෂිත ළිඳ', 'Protected well', 'பாதுகாக்கப்பட்ட கிணறு'),
    PickOption('unprotected_well', 'අනාරක්ෂිත ළිඳ', 'Unprotected well', 'பாதுகாப்பற்ற கிணறு'),
    PickOption('tube_well', 'නළ ළිඳ', 'Tube well', 'குழாய்க் கிணறு'),
    PickOption('stream', 'දිය පහර / ඇළ', 'Stream / canal', 'நீரோடை / கால்வாய்'),
    PickOption('bowser', 'ජල බවුසර්', 'Water bowser', 'நீர் பவுசர்'),
    _other,
  ]),
  PickListDef(PL.toilet, Tri('වැසිකිළිය', 'Toilet', 'மலசலகூடம்'), [
    PickOption('water_seal_in', 'ජල මුද්‍රිත (නිවස තුළ)', 'Water-seal (inside the house)', 'நீர் அடைப்பு (வீட்டினுள்)'),
    PickOption('water_seal_out', 'ජල මුද්‍රිත (පිටත)', 'Water-seal (outside)', 'நீர் அடைப்பு (வெளியே)'),
    PickOption('pit', 'වළ වැසිකිළිය', 'Pit latrine', 'குழி மலசலகூடம்'),
    PickOption('common', 'පොදු', 'Shared', 'பொது'),
    _none,
  ]),

  // ---------------- පවුල / Family / குடும்பம் ----------------
  PickListDef(PL.tenure, Tri('නිවසට ඇති අයිතිය', 'House tenure', 'வீட்டின் மீதான உரிமை'), [
    PickOption('own', 'තමන්ගේ', 'Owned', 'சொந்தம்'),
    PickOption('rent', 'කුලියට', 'Rented', 'வாடகை'),
    PickOption('free', 'නොමිලේ (නෑදෑයින්ගේ)', "Free (relatives')", 'இலவசம் (உறவினருடையது)'),
    PickOption('encroached', 'අනවසර', 'Encroached', 'அனுமதியற்றது'),
    unknown,
  ]),
  PickListDef(PL.incomeRange, Tri('මාසික ආදායම', 'Monthly income', 'மாதாந்த வருமானம்'), [
    PickOption('lt25', 'රු. 25,000 ට අඩු', 'Under Rs. 25,000', 'ரூ. 25,000 இற்குக் குறைவு'),
    PickOption('25_50', 'රු. 25,000 – 50,000', 'Rs. 25,000 – 50,000', 'ரூ. 25,000 – 50,000'),
    PickOption('50_100', 'රු. 50,000 – 100,000', 'Rs. 50,000 – 100,000', 'ரூ. 50,000 – 100,000'),
    PickOption('100_200', 'රු. 100,000 – 200,000', 'Rs. 100,000 – 200,000', 'ரூ. 100,000 – 200,000'),
    PickOption('gt200', 'රු. 200,000 ට වැඩි', 'Over Rs. 200,000', 'ரூ. 200,000 இற்கு மேல்'),
    PickOption('declined', 'ලබා දීමට අකමැතියි', 'Declined to say', 'தெரிவிக்க விரும்பவில்லை'),
    unknown,
  ], editable: false),
  PickListDef(PL.incomeSource, Tri('ප්‍රධාන ආදායම් මාර්ගය', 'Main source of income', 'பிரதான வருமான மூலம்'), [
    PickOption('govt', 'රජයේ රැකියා', 'Government job', 'அரச தொழில்'),
    PickOption('private', 'පෞද්ගලික රැකියා', 'Private-sector job', 'தனியார் தொழில்'),
    PickOption('self', 'ස්වයං රැකියා', 'Self-employment', 'சுயதொழில்'),
    PickOption('farming', 'ගොවිතැන', 'Farming', 'விவசாயம்'),
    PickOption('livestock', 'සත්ව පාලනය', 'Livestock', 'கால்நடை வளர்ப்பு'),
    PickOption('daily_wage', 'දෛනික වැටුප්', 'Daily wages', 'நாட்கூலி'),
    PickOption('foreign', 'විදේශ රැකියා', 'Foreign employment', 'வெளிநாட்டு வேலைவாய்ப்பு'),
    PickOption('pension', 'විශ්‍රාම වැටුප', 'Pension', 'ஓய்வூதியம்'),
    PickOption('welfare', 'සුබසාධන දීමනා', 'Welfare payments', 'நலன்புரிக் கொடுப்பனவுகள்'),
    PickOption('business', 'ව්‍යාපාර', 'Business', 'வியாபாரம்'),
    _other,
  ]),
  PickListDef(PL.cookingFuel, Tri('ඉන්ධන', 'Cooking fuel', 'சமையல் எரிபொருள்'), [
    PickOption('gas', 'ගෑස්', 'Gas', 'எரிவாயு'),
    PickOption('firewood', 'දර', 'Firewood', 'விறகு'),
    PickOption('electric', 'විදුලි', 'Electricity', 'மின்சாரம்'),
    PickOption('kerosene', 'භූමිතෙල්', 'Kerosene', 'மண்ணெண்ணெய்'),
    _other,
  ]),
  PickListDef(PL.welfare, Tri('සුබසාධන ප්‍රතිලාභ', 'Welfare benefits', 'நலன்புரி நன்மைகள்'), [
    PickOption('aswesuma', 'අස්වැසුම', 'Aswesuma', 'அஸ்வெசும'),
    PickOption('samurdhi', 'සමෘද්ධි', 'Samurdhi', 'சமுர்த்தி'),
    PickOption('elderly', 'වැඩිහිටි දීමනා', 'Elderly allowance', 'முதியோர் கொடுப்பனவு'),
    PickOption('disability', 'ආබාධිත දීමනා', 'Disability allowance', 'மாற்றுத்திறனாளிக் கொடுப்பனவு'),
    PickOption('ckd', 'වකුගඩු රෝගී දීමනා', 'Kidney patient allowance', 'சிறுநீரக நோயாளர் கொடுப்பனவு'),
    PickOption('public_assistance', 'මහජනාධාර', 'Public assistance', 'பொது உதவிக் கொடுப்பனவு'),
    _other,
  ]),

  // ---------------- පුද්ගලයා / Person / நபர் ----------------
  PickListDef(PL.gender, Tri('ස්ත්‍රී / පුරුෂ', 'Sex', 'பால்'), [
    PickOption('m', 'පුරුෂ', 'Male', 'ஆண்'),
    PickOption('f', 'ස්ත්‍රී', 'Female', 'பெண்'),
  ], editable: false),
  PickListDef(PL.relation, Tri('ප්‍රධානියාට සම්බන්ධතාව', 'Relationship to head', 'தலைவருடனான உறவுமுறை'), [
    PickOption('head', 'ප්‍රධානියා', 'Head', 'தலைவர்'),
    PickOption('spouse', 'භාර්යාව / ස්වාමියා', 'Wife / husband', 'மனைவி / கணவன்'),
    PickOption('son', 'පුතා', 'Son', 'மகன்'),
    PickOption('daughter', 'දුව', 'Daughter', 'மகள்'),
    PickOption('father', 'පියා', 'Father', 'தந்தை'),
    PickOption('mother', 'මව', 'Mother', 'தாய்'),
    PickOption('grandchild', 'මුණුබුරා / මිණිබිරිය', 'Grandson / granddaughter', 'பேரன் / பேத்தி'),
    PickOption('son_in_law', 'බෑණා', 'Son-in-law', 'மருமகன்'),
    PickOption('daughter_in_law', 'ලේලි', 'Daughter-in-law', 'மருமகள்'),
    PickOption('sibling', 'සහෝදර / සහෝදරිය', 'Brother / sister', 'சகோதரன் / சகோதரி'),
    PickOption('other_relative', 'වෙනත් ඥාතියෙක්', 'Other relative', 'வேறு உறவினர்'),
    PickOption('non_relative', 'ඥාති නොවන', 'Non-relative', 'உறவினர் அல்லாதவர்'),
  ]),
  PickListDef(PL.ethnicity, Tri('ජාතිය', 'Ethnicity', 'இனம்'), [
    PickOption('sinhala', 'සිංහල', 'Sinhala', 'சிங்களவர்'),
    PickOption('sl_tamil', 'ශ්‍රී ලාංකික දෙමළ', 'Sri Lankan Tamil', 'இலங்கைத் தமிழர்'),
    PickOption('indian_tamil', 'ඉන්දියානු දෙමළ', 'Indian Tamil', 'இந்தியத் தமிழர்'),
    PickOption('muslim', 'මුස්ලිම්', 'Muslim', 'முஸ்லிம்'),
    PickOption('burgher', 'බර්ගර්', 'Burgher', 'பறங்கியர்'),
    _other,
  ]),
  PickListDef(PL.religion, Tri('ආගම', 'Religion', 'மதம்'), [
    PickOption('buddhist', 'බෞද්ධ', 'Buddhist', 'பௌத்தம்'),
    PickOption('hindu', 'හින්දු', 'Hindu', 'இந்து'),
    PickOption('islam', 'ඉස්ලාම්', 'Islam', 'இஸ்லாம்'),
    PickOption('catholic', 'රෝමානු කතෝලික', 'Roman Catholic', 'றோமன் கத்தோலிக்கம்'),
    PickOption('christian', 'ක්‍රිස්තියානි', 'Christian', 'கிறிஸ்தவம்'),
    _other,
  ]),
  PickListDef(PL.civilStatus, Tri('විවාහක තත්ත්වය', 'Civil status', 'திருமண நிலை'), [
    PickOption('single', 'අවිවාහක', 'Never married', 'திருமணமாகாதவர்'),
    PickOption('married', 'විවාහක', 'Married', 'திருமணமானவர்'),
    PickOption('widowed', 'වැන්දඹු', 'Widowed', 'துணையை இழந்தவர்'),
    PickOption('divorced', 'දික්කසාද', 'Divorced', 'விவாகரத்துப் பெற்றவர்'),
    PickOption('separated', 'වෙන්ව සිටී', 'Separated', 'பிரிந்து வாழ்பவர்'),
  ], editable: false),
  PickListDef(PL.education, Tri('අධ්‍යාපනය', 'Education', 'கல்வி'), [
    PickOption('preschool', 'පෙර පාසල් / පාසල් නොයන ළමයා', 'Pre-school / not yet at school',
        'முன்பள்ளி / பாடசாலை செல்லாத சிறுவர்'),
    PickOption('schooling', 'දැනට පාසල් යයි', 'Currently at school', 'தற்போது பாடசாலை செல்கிறார்'),
    PickOption('none', 'පාසල් නොගිය', 'Never attended school', 'பாடசாலை செல்லாதவர்'),
    PickOption('g1_5', '1 – 5 ශ්‍රේණි', 'Grades 1 – 5', 'தரம் 1 – 5'),
    PickOption('g6_11', '6 – 11 ශ්‍රේණි', 'Grades 6 – 11', 'தரம் 6 – 11'),
    PickOption('ol', 'අ.පො.ස. සාමාන්‍ය පෙළ', 'G.C.E. O/L', 'க.பொ.த. சாதாரண தரம்'),
    PickOption('al', 'අ.පො.ස. උසස් පෙළ', 'G.C.E. A/L', 'க.பொ.த. உயர் தரம்'),
    PickOption('diploma', 'ඩිප්ලෝමා', 'Diploma', 'டிப்ளோமா'),
    PickOption('degree', 'උපාධි', 'Degree', 'பட்டம்'),
    PickOption('postgrad', 'පශ්චාත් උපාධි', 'Postgraduate', 'பட்டப்பின்படிப்பு'),
  ]),
  PickListDef(PL.occupation, Tri('රැකියාව', 'Occupation', 'தொழில்'), [
    PickOption('govt', 'රජයේ රැකියා', 'Government job', 'அரச தொழில்'),
    PickOption('private', 'පෞද්ගලික රැකියා', 'Private-sector job', 'தனியார் தொழில்'),
    PickOption('self', 'ස්වයං රැකියා', 'Self-employed', 'சுயதொழில்'),
    PickOption('farmer', 'ගොවිතැන', 'Farming', 'விவசாயம்'),
    PickOption('daily_wage', 'දෛනික වැටුප්', 'Daily wages', 'நாட்கூலி'),
    PickOption('foreign', 'විදේශ රැකියා', 'Foreign employment', 'வெளிநாட்டு வேலைவாய்ப்பு'),
    PickOption('retired', 'විශ්‍රාමික', 'Retired', 'ஓய்வுபெற்றவர்'),
    PickOption('unemployed', 'විරැකියා', 'Unemployed', 'வேலையற்றவர்'),
    PickOption('student', 'ශිෂ්‍ය', 'Student', 'மாணவர்'),
    PickOption('homemaker', 'ගෘහණිය', 'Homemaker', 'இல்லத்தரசி'),
    PickOption('child', 'ළමයා', 'Child', 'சிறுவர்'),
    _other,
  ]),
  PickListDef(PL.disability, Tri('ආබාධ', 'Disability', 'மாற்றுத்திறன்'), [
    _none,
    PickOption('physical', 'ශාරීරික', 'Physical', 'உடல்'),
    PickOption('visual', 'දෘශ්‍ය', 'Visual', 'பார்வை'),
    PickOption('hearing', 'ශ්‍රවණ', 'Hearing', 'செவிப்புலன்'),
    PickOption('mental', 'මානසික', 'Mental', 'உளம்'),
    _other,
  ]),
  PickListDef(PL.personStatus, Tri('පදිංචි තත්ත්වය', 'Residence status', 'வசிப்பு நிலை'), [
    PickOption('resident', 'පදිංචිව සිටී', 'Resident', 'வசிக்கிறார்'),
    PickOption('away', 'තාවකාලිකව නැත (විදේශ / රැකියා)', 'Temporarily away (abroad / work)',
        'தற்காலிகமாக இல்லை (வெளிநாடு / வேலை)'),
    PickOption('moved', 'පදිංචිය හැර ගොස්', 'Moved away', 'குடிபெயர்ந்தார்'),
    PickOption('dead', 'මියගොස්', 'Deceased', 'இறந்தவர்'),
  ], editable: false),

  // ---------------- ගස් හා බෝග / Trees & crops / மரங்கள் & பயிர்கள் ----------------
  PickListDef(PL.treeCountSpecies, Tri('ගස් වර්ග (ගණනය කරන)', 'Tree species (counted)', 'மர வகைகள் (எண்ணப்படுபவை)'), [
    PickOption('coconut', 'පොල්', 'Coconut', 'தென்னை'),
    PickOption('jak', 'කොස්', 'Jak', 'பலா'),
    PickOption('breadfruit', 'දෙල්', 'Breadfruit', 'ஈரப்பலா'),
    PickOption('mango', 'අඹ', 'Mango', 'மா'),
    PickOption('arecanut', 'පුවක්', 'Arecanut', 'பாக்கு'),
    PickOption('kitul', 'කිතුල්', 'Kitul', 'கித்துள்'),
    PickOption('palmyrah', 'තල්', 'Palmyrah', 'பனை'),
    PickOption('banana', 'කෙසෙල් (පඳුරු)', 'Banana (clumps)', 'வாழை (குற்றிகள்)'),
    PickOption('pepper', 'ගම්මිරිස් (වැල්)', 'Pepper (vines)', 'மிளகு (கொடிகள்)'),
    PickOption('rambutan', 'රඹුටන්', 'Rambutan', 'ரம்புட்டான்'),
    PickOption('durian', 'දූරියන්', 'Durian', 'டுரியன்'),
    PickOption('mangosteen', 'මැංගුස්', 'Mangosteen', 'மங்குஸ்தான்'),
    PickOption('orange', 'දොඩම්', 'Orange', 'தோடை'),
    PickOption('lime', 'දෙහි', 'Lime', 'தேசி'),
    PickOption('papaya', 'පැපොල්', 'Papaya', 'பப்பாசி'),
    PickOption('guava', 'පේර', 'Guava', 'கொய்யா'),
    PickOption('rose_apple', 'ජම්බු', 'Rose apple (jambu)', 'ஜம்பு'),
    PickOption('clove', 'කරාබු නැටි', 'Clove', 'கராம்பு'),
    PickOption('nutmeg', 'සාදික්කා', 'Nutmeg', 'சாதிக்காய்'),
    PickOption('coffee', 'කෝපි', 'Coffee', 'கோப்பி'),
    PickOption('cocoa', 'කොකෝවා', 'Cocoa', 'கொக்கோ'),
    PickOption('rubber', 'රබර්', 'Rubber', 'இறப்பர்'),
    PickOption('goraka', 'ගොරකා', 'Goraka', 'கொறுக்காய்'),
    PickOption('avocado', 'අලිගැටපේර', 'Avocado', 'அவகாடோ (பட்டர் பழம்)'),
    _other,
  ]),
  PickListDef(PL.treeSingleSpecies,
      Tri('දැව / වටිනා ගස් (තනි තනිව)', 'Timber / valuable trees (one by one)', 'வெட்டு / பெறுமதியான மரங்கள் (தனித்தனியாக)'), [
    PickOption('teak', 'තේක්ක', 'Teak', 'தேக்கு'),
    PickOption('mahogany', 'මහෝගනී', 'Mahogany', 'மஹோகனி'),
    PickOption('jak_timber', 'කොස් (දැව)', 'Jak (timber)', 'பலா (வெட்டு மரம்)'),
    PickOption('halmilla', 'හල්මිල්ල', 'Halmilla', 'ஹல்மில்லா'),
    PickOption('ebony', 'කළුවර', 'Ebony', 'கருங்காலி'),
    PickOption('nadun', 'නැදුන්', 'Nadun', 'நாதுன்'),
    PickOption('burutha', 'බුරුත', 'Satinwood (burutha)', 'முதிரை'),
    PickOption('kumbuk', 'කුඹුක්', 'Kumbuk', 'மருது'),
    PickOption('hora', 'හොර', 'Hora', 'ஹோரா'),
    PickOption('albizia', 'ඇල්බීසියා', 'Albizia', 'அல்பீசியா'),
    PickOption('eucalyptus', 'යුකැලිප්ටස්', 'Eucalyptus', 'யூகலிப்டஸ்'),
    PickOption('bo', 'බෝ', 'Bo tree', 'அரச மரம்'),
    PickOption('banyan', 'නුග', 'Banyan', 'ஆலமரம்'),
    _other,
  ]),
  PickListDef(PL.treeCondition, Tri('ගසේ තත්ත්වය', 'Tree condition', 'மரத்தின் நிலைமை'), [
    PickOption('healthy', 'නිරෝගී', 'Healthy', 'ஆரோக்கியமானது'),
    PickOption('diseased', 'රෝගී', 'Diseased', 'நோயுற்றது'),
    PickOption('dying', 'මැරෙමින්', 'Dying', 'பட்டுப்போகிறது'),
    PickOption('dead', 'මැරී ඇත', 'Dead', 'பட்டுப்போனது'),
  ], editable: false),
  PickListDef(PL.crop, Tri('බෝග', 'Crop', 'பயிர்'), [
    PickOption('tea', 'තේ', 'Tea', 'தேயிலை'),
    PickOption('paddy', 'වී', 'Paddy', 'நெல்'),
    PickOption('vegetables', 'එළවළු', 'Vegetables', 'மரக்கறி'),
    PickOption('cinnamon', 'කුරුඳු', 'Cinnamon', 'கறுவா'),
    PickOption('maize', 'බඩඉරිඟු', 'Maize', 'சோளம்'),
    PickOption('finger_millet', 'කුරක්කන්', 'Finger millet (kurakkan)', 'குரக்கன்'),
    PickOption('yams', 'අල වර්ග', 'Yams / tubers', 'கிழங்கு வகைகள்'),
    PickOption('groundnut', 'රටකජු', 'Groundnut', 'நிலக்கடலை (கச்சான்)'),
    PickOption('green_gram', 'මුං ඇට', 'Green gram', 'பயறு'),
    PickOption('cowpea', 'කවුපි', 'Cowpea', 'கௌபி'),
    PickOption('chilli', 'මිරිස්', 'Chilli', 'மிளகாய்'),
    PickOption('onion', 'ළූණු', 'Onion', 'வெங்காயம்'),
    PickOption('ginger', 'ඉඟුරු', 'Ginger', 'இஞ்சி'),
    PickOption('turmeric', 'කහ', 'Turmeric', 'மஞ்சள்'),
    PickOption('pineapple', 'අන්නාසි', 'Pineapple', 'அன்னாசி'),
    PickOption('fodder', 'තණකොළ', 'Fodder grass', 'தீவனப் புல்'),
    _other,
  ]),
  PickListDef(PL.cropUnit, Tri('ඒකකය', 'Unit', 'அலகு'), [
    PickOption('perch', 'පර්චස්', 'Perches', 'பேர்ச்'),
    PickOption('acre', 'අක්කර', 'Acres', 'ஏக்கர்'),
    PickOption('hectare', 'හෙක්ටයාර', 'Hectares', 'ஹெக்டேயர்'),
    PickOption('plants', 'පැළ ගණන', 'Number of plants', 'கன்றுகளின் எண்ணிக்கை'),
  ], editable: false),
  PickListDef(PL.season, Tri('කන්නය', 'Season', 'போகம்'), [
    PickOption('yala', 'යල', 'Yala', 'சிறுபோகம்'),
    PickOption('maha', 'මහ', 'Maha', 'பெரும்போகம்'),
    PickOption('both', 'යල හා මහ', 'Yala & Maha', 'சிறுபோகமும் பெரும்போகமும்'),
    PickOption('perennial', 'බහු වාර්ෂික', 'Perennial', 'பல்லாண்டு'),
  ], editable: false),
  PickListDef(PL.irrigation, Tri('ජල සම්පාදනය', 'Water supply', 'நீர் வழங்கல்'), [
    PickOption('rain', 'වැසි', 'Rain-fed', 'மழை நீர்'),
    PickOption('irrigated', 'වාරි', 'Irrigated', 'நீர்ப்பாசனம்'),
    PickOption('well', 'ළිං', 'Well', 'கிணறு'),
    _other,
  ]),
  PickListDef(PL.cultivator, Tri('වගා කරන්නා', 'Cultivated by', 'பயிர்செய்பவர்'), [
    PickOption('owner', 'අයිතිකරු', 'Owner', 'உரிமையாளர்'),
    PickOption('tenant_farmer', 'අඳ ගොවියා', 'Tenant cultivator (ande)', 'குத்தகைப் பயிர்ச்செய்கையாளர்'),
    PickOption('lessee', 'බදුකරු', 'Lessee', 'குத்தகைதாரர்'),
    _other,
  ], editable: false),

  // ---------------- සතුන් / Animals / விலங்குகள் ----------------
  PickListDef(PL.animal, Tri('සත්ව වර්ගය', 'Animal type', 'விலங்கு வகை'), [
    PickOption('cattle', 'ගවයින්', 'Cattle', 'மாடுகள்'),
    PickOption('buffalo', 'මී හරකුන්', 'Buffaloes', 'எருமைகள்'),
    PickOption('goat', 'එළුවන්', 'Goats', 'ஆடுகள்'),
    PickOption('sheep', 'බැටළුවන්', 'Sheep', 'செம்மறியாடுகள்'),
    PickOption('pig', 'ඌරන්', 'Pigs', 'பன்றிகள்'),
    PickOption('layer', 'කුකුළන් (බිත්තර)', 'Chickens (layers)', 'கோழிகள் (முட்டை)'),
    PickOption('broiler', 'කුකුළන් (මස්)', 'Chickens (broilers)', 'கோழிகள் (இறைச்சி)'),
    PickOption('village_chicken', 'ගම් කුකුළන්', 'Village chickens', 'நாட்டுக் கோழிகள்'),
    PickOption('duck', 'තාරාවන්', 'Ducks', 'தாராக்கள்'),
    PickOption('turkey', 'ටර්කි', 'Turkeys', 'வான்கோழிகள்'),
    PickOption('quail', 'වටුවන්', 'Quails', 'காடைகள்'),
    PickOption('dog', 'සුනඛයින්', 'Dogs', 'நாய்கள்'),
    PickOption('cat', 'බළලුන්', 'Cats', 'பூனைகள்'),
    PickOption('rabbit', 'හාවුන්', 'Rabbits', 'முயல்கள்'),
    PickOption('bee_box', 'මී මැසි පෙට්ටි', 'Bee boxes', 'தேனீப் பெட்டிகள்'),
    PickOption('fish_pond', 'මත්ස්‍ය පොකුණු', 'Fish ponds', 'மீன் குளங்கள்'),
    _other,
  ]),
  PickListDef(PL.animalPurpose, Tri('අරමුණ', 'Purpose', 'நோக்கம்'), [
    PickOption('milk', 'කිරි', 'Milk', 'பால்'),
    PickOption('meat', 'මස්', 'Meat', 'இறைச்சி'),
    PickOption('eggs', 'බිත්තර', 'Eggs', 'முட்டை'),
    PickOption('work', 'වැඩ', 'Draught work', 'வேலை'),
    PickOption('pet', 'සුරතල්', 'Pet', 'செல்லப்பிராணி'),
    PickOption('breeding', 'අභිජනනය', 'Breeding', 'இனப்பெருக்கம்'),
    _other,
  ]),
  PickListDef(PL.animalHousing, Tri('රඳවන ආකාරය', 'Housing', 'வளர்க்கும் முறை'), [
    PickOption('shed', 'මඩුව / කූඩුව', 'Shed / coop', 'கொட்டில் / கூடு'),
    PickOption('free', 'නිදහසේ', 'Free-range', 'சுதந்திரமாக'),
    PickOption('tethered', 'බැඳ', 'Tethered', 'கட்டி வைத்து'),
    _other,
  ], editable: false),
];

/// Custom option added by the officer (mirrors a `pick_items` row).
class CustomPick {
  const CustomPick(this.listName, this.code, this.label, {this.active = true});
  final String listName;
  final String code;
  final String label;
  final bool active;
}

/// Merges built-in and custom options. Loaded once at startup and refreshed
/// whenever the officer edits a list.
class PickRegistry {
  PickRegistry._();
  static final PickRegistry instance = PickRegistry._();

  final Map<String, PickListDef> _defs = {
    for (final d in pickListDefs) d.name: d,
  };
  List<CustomPick> _custom = const [];

  void setCustom(List<CustomPick> custom) => _custom = custom;

  PickListDef def(String list) => _defs[list]!;

  /// Options shown in pickers: built-ins first, then active custom options.
  List<PickOption> options(String list) => [
        ..._defs[list]!.options,
        for (final c in _custom)
          if (c.listName == list && c.active) PickOption.custom(c.code, c.label),
      ];

  /// Label for a stored code in the current language. Unknown codes (e.g. a
  /// hidden custom option) still resolve, so old data keeps displaying.
  String label(String list, String? code) {
    if (code == null || code.isEmpty) return '—';
    for (final o in _defs[list]!.options) {
      if (o.code == code) return o.label;
    }
    for (final c in _custom) {
      if (c.listName == list && c.code == code) return c.label;
    }
    return code;
  }

  /// Labels for a comma separated multi-select value (e.g. welfare schemes).
  String labels(String list, String? codes) {
    final parts = splitCodes(codes);
    if (parts.isEmpty) return '—';
    return parts.map((c) => label(list, c)).join(', ');
  }
}

List<String> splitCodes(String? codes) =>
    (codes ?? '').split(',').where((s) => s.trim().isNotEmpty).toList();

String joinCodes(Iterable<String> codes) => codes.join(',');

/// Shorthand used throughout the UI.
String pl(String list, String? code) => PickRegistry.instance.label(list, code);
