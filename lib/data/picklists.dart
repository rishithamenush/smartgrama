/// Pick lists ("තේරීම් ලැයිස්තු").
///
/// Values are stored in the database as stable [PickOption.code]s, and the
/// Sinhala label is looked up at display time. This keeps counts accurate
/// ("පොල්" is always `coconut`) and lets Tamil/English be added later.
///
/// The officer can add extra options per list; those live in the
/// `pick_items` table and are merged in by [PickRegistry].
library;

class PickOption {
  const PickOption(this.code, this.label);
  final String code;
  final String label;
}

class PickListDef {
  const PickListDef(this.name, this.title, this.options, {this.editable = true});
  final String name;
  final String title;
  final List<PickOption> options;

  /// Whether the officer may add custom options to this list.
  final bool editable;
}

const unknown = PickOption('unknown', 'නොදනී');

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
  // ---------------- ඉඩම ----------------
  PickListDef(PL.landUse, 'ඉඩම් භාවිතය', [
    PickOption('home_garden', 'ගෙවත්ත'),
    PickOption('paddy', 'කුඹුර'),
    PickOption('tea', 'තේ'),
    PickOption('coconut', 'පොල්'),
    PickOption('rubber', 'රබර්'),
    PickOption('chena', 'හේන'),
    PickOption('mixed', 'මිශ්‍ර වගාව'),
    PickOption('vegetable', 'එළවළු'),
    PickOption('bare', 'හිස් ඉඩම'),
    PickOption('commercial', 'වාණිජ'),
    PickOption('religious', 'ආගමික'),
    PickOption('forest', 'කැලෑ / රක්ෂිත'),
    PickOption('water_body', 'ජලාශ'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.ownership, 'අයිතියේ වර්ගය', [
    PickOption('private_deed', 'පෞද්ගලික ඔප්පු'),
    PickOption('state_permit', 'රජයේ බලපත්‍ර'),
    PickOption('jaya_bhoomi', 'ජය භූමි ප්‍රදාන'),
    PickOption('swarna_bhoomi', 'ස්වර්ණ භූමි ප්‍රදාන'),
    PickOption('lrc', 'ඉඩම් ප්‍රතිසංස්කරණ කොමිෂන් (LRC)'),
    PickOption('temple', 'පන්සල් / දේවාල'),
    PickOption('state', 'රජයේ ඉඩම'),
    PickOption('reserve', 'රක්ෂිත'),
    PickOption('lease', 'බදු'),
    PickOption('encroached', 'අනවසර'),
    PickOption('disputed', 'ආරවුලක'),
    unknown,
  ]),
  PickListDef(PL.extentSource, 'ප්‍රමාණයේ මූලාශ්‍රය', [
    PickOption('deed', 'ඔප්පුව'),
    PickOption('plan', 'පිඹුර'),
    PickOption('estimate', 'ඇස්තමේන්තු'),
    PickOption('gps', 'GPS මැනීම'),
  ], editable: false),
  PickListDef(PL.partyRole, 'ඉඩමට සම්බන්ධතාව', [
    PickOption('owner', 'අයිතිකරු'),
    PickOption('occupant', 'පදිංචිකරු / භුක්තිය'),
    PickOption('heir', 'උරුමකරු'),
    PickOption('lessee', 'බදුකරු'),
    PickOption('tenant_farmer', 'අඳ ගොවියා'),
  ], editable: false),
  PickListDef(PL.yesNoUnknown, 'ඔව් / නැත', [
    PickOption('yes', 'ඔව්'),
    PickOption('no', 'නැත'),
    unknown,
  ], editable: false),
  PickListDef(PL.infoSource, 'තොරතුරු මූලාශ්‍රය', [
    PickOption('observed', 'ස්ථානයට ගොස් නිරීක්ෂණය'),
    PickOption('told', 'පවුලේ සාමාජිකයා පැවසීම'),
    PickOption('document', 'ලේඛනයෙන් (ඔප්පුව, හැඳුනුම්පත)'),
    PickOption('old_register', 'පැරණි ගෘහ ලේඛනයෙන්'),
  ], editable: false),

  // ---------------- ගොඩනැගිලි ----------------
  PickListDef(PL.buildingType, 'ගොඩනැගිලි වර්ගය', [
    PickOption('house', 'නිවස'),
    PickOption('shop', 'කඩය'),
    PickOption('store', 'ගබඩාව'),
    PickOption('cattle_shed', 'ගව මඩුව'),
    PickOption('poultry_house', 'කුකුළු කූඩුව'),
    PickOption('pig_sty', 'ඌරු කොටුව'),
    PickOption('toilet', 'වැසිකිළිය'),
    PickOption('well', 'ළිඳ'),
    PickOption('garage', 'වාහන ගාල'),
    PickOption('industry', 'කර්මාන්ත ස්ථානය'),
    PickOption('religious', 'ආගමික ගොඩනැගිල්ල'),
    PickOption('school', 'පාසල'),
    PickOption('community_hall', 'ප්‍රජා ශාලාව'),
    PickOption('unfinished', 'නොනිමි ගොඩනැගිල්ල'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.wall, 'බිත්ති', [
    PickOption('brick', 'ගඩොල්'),
    PickOption('cement_block', 'සිමෙන්ති බ්ලොක්'),
    PickOption('cabook', 'කබොක්'),
    PickOption('mud', 'මැටි'),
    PickOption('wood', 'ලෑලි'),
    PickOption('metal_sheet', 'ටකරන්'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.roof, 'වහලය', [
    PickOption('tile', 'උළු'),
    PickOption('asbestos', 'ඇස්බැස්ටෝස්'),
    PickOption('metal_sheet', 'ටකරන්'),
    PickOption('concrete', 'කොන්ක්‍රීට්'),
    PickOption('cadjan', 'පොල් අතු / පිදුරු'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.floor, 'පොළොව', [
    PickOption('tile', 'ටයිල්'),
    PickOption('cement', 'සිමෙන්ති'),
    PickOption('terrazzo', 'ටෙරාසෝ'),
    PickOption('mud', 'මැටි'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.permanence, 'ස්ථිරභාවය', [
    PickOption('permanent', 'ස්ථිර'),
    PickOption('semi', 'අර්ධ ස්ථිර'),
    PickOption('temporary', 'තාවකාලික'),
  ], editable: false),
  PickListDef(PL.condition, 'තත්ත්වය', [
    PickOption('good', 'හොඳයි'),
    PickOption('fair', 'සාමාන්‍යයි'),
    PickOption('poor', 'අබලන්'),
    PickOption('unusable', 'භාවිතයට නුසුදුසුයි'),
  ], editable: false),
  PickListDef(PL.buildingUsage, 'භාවිතය', [
    PickOption('residence', 'වාසය'),
    PickOption('commercial', 'වාණිජ'),
    PickOption('mixed', 'මිශ්‍ර'),
    PickOption('vacant', 'හිස්'),
    PickOption('rented', 'කුලියට'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.electricity, 'විදුලිය', [
    PickOption('grid', 'ජාතික ජාලය'),
    PickOption('solar', 'සූර්ය'),
    PickOption('none', 'නැත'),
  ]),
  PickListDef(PL.water, 'ජල මූලාශ්‍රය', [
    PickOption('pipe_national', 'නළ ජලය (ජාතික)'),
    PickOption('pipe_community', 'ප්‍රජා ජල ව්‍යාපෘතිය'),
    PickOption('protected_well', 'ආරක්ෂිත ළිඳ'),
    PickOption('unprotected_well', 'අනාරක්ෂිත ළිඳ'),
    PickOption('tube_well', 'නළ ළිඳ'),
    PickOption('stream', 'දිය පහර / ඇළ'),
    PickOption('bowser', 'ජල බවුසර්'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.toilet, 'වැසිකිළිය', [
    PickOption('water_seal_in', 'ජල මුද්‍රිත (නිවස තුළ)'),
    PickOption('water_seal_out', 'ජල මුද්‍රිත (පිටත)'),
    PickOption('pit', 'වළ වැසිකිළිය'),
    PickOption('common', 'පොදු'),
    PickOption('none', 'නැත'),
  ]),

  // ---------------- පවුල ----------------
  PickListDef(PL.tenure, 'නිවසට ඇති අයිතිය', [
    PickOption('own', 'තමන්ගේ'),
    PickOption('rent', 'කුලියට'),
    PickOption('free', 'නොමිලේ (නෑදෑයින්ගේ)'),
    PickOption('encroached', 'අනවසර'),
    unknown,
  ]),
  PickListDef(PL.incomeRange, 'මාසික ආදායම', [
    PickOption('lt25', 'රු. 25,000 ට අඩු'),
    PickOption('25_50', 'රු. 25,000 – 50,000'),
    PickOption('50_100', 'රු. 50,000 – 100,000'),
    PickOption('100_200', 'රු. 100,000 – 200,000'),
    PickOption('gt200', 'රු. 200,000 ට වැඩි'),
    PickOption('declined', 'ලබා දීමට අකමැතියි'),
    unknown,
  ], editable: false),
  PickListDef(PL.incomeSource, 'ප්‍රධාන ආදායම් මාර්ගය', [
    PickOption('govt', 'රජයේ රැකියා'),
    PickOption('private', 'පෞද්ගලික රැකියා'),
    PickOption('self', 'ස්වයං රැකියා'),
    PickOption('farming', 'ගොවිතැන'),
    PickOption('livestock', 'සත්ව පාලනය'),
    PickOption('daily_wage', 'දෛනික වැටුප්'),
    PickOption('foreign', 'විදේශ රැකියා'),
    PickOption('pension', 'විශ්‍රාම වැටුප'),
    PickOption('welfare', 'සුබසාධන දීමනා'),
    PickOption('business', 'ව්‍යාපාර'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.cookingFuel, 'ඉන්ධන', [
    PickOption('gas', 'ගෑස්'),
    PickOption('firewood', 'දර'),
    PickOption('electric', 'විදුලි'),
    PickOption('kerosene', 'භූමිතෙල්'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.welfare, 'සුබසාධන ප්‍රතිලාභ', [
    PickOption('aswesuma', 'අස්වැසුම'),
    PickOption('samurdhi', 'සමෘද්ධි'),
    PickOption('elderly', 'වැඩිහිටි දීමනා'),
    PickOption('disability', 'ආබාධිත දීමනා'),
    PickOption('ckd', 'වකුගඩු රෝගී දීමනා'),
    PickOption('public_assistance', 'මහජනාධාර'),
    PickOption('other', 'වෙනත්'),
  ]),

  // ---------------- පුද්ගලයා ----------------
  PickListDef(PL.gender, 'ස්ත්‍රී / පුරුෂ', [
    PickOption('m', 'පුරුෂ'),
    PickOption('f', 'ස්ත්‍රී'),
  ], editable: false),
  PickListDef(PL.relation, 'ප්‍රධානියාට සම්බන්ධතාව', [
    PickOption('head', 'ප්‍රධානියා'),
    PickOption('spouse', 'භාර්යාව / ස්වාමියා'),
    PickOption('son', 'පුතා'),
    PickOption('daughter', 'දුව'),
    PickOption('father', 'පියා'),
    PickOption('mother', 'මව'),
    PickOption('grandchild', 'මුණුබුරා / මිණිබිරිය'),
    PickOption('son_in_law', 'බෑණා'),
    PickOption('daughter_in_law', 'ලේලි'),
    PickOption('sibling', 'සහෝදර / සහෝදරිය'),
    PickOption('other_relative', 'වෙනත් ඥාතියෙක්'),
    PickOption('non_relative', 'ඥාති නොවන'),
  ]),
  PickListDef(PL.ethnicity, 'ජාතිය', [
    PickOption('sinhala', 'සිංහල'),
    PickOption('sl_tamil', 'ශ්‍රී ලාංකික දෙමළ'),
    PickOption('indian_tamil', 'ඉන්දියානු දෙමළ'),
    PickOption('muslim', 'මුස්ලිම්'),
    PickOption('burgher', 'බර්ගර්'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.religion, 'ආගම', [
    PickOption('buddhist', 'බෞද්ධ'),
    PickOption('hindu', 'හින්දු'),
    PickOption('islam', 'ඉස්ලාම්'),
    PickOption('catholic', 'රෝමානු කතෝලික'),
    PickOption('christian', 'ක්‍රිස්තියානි'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.civilStatus, 'විවාහක තත්ත්වය', [
    PickOption('single', 'අවිවාහක'),
    PickOption('married', 'විවාහක'),
    PickOption('widowed', 'වැන්දඹු'),
    PickOption('divorced', 'දික්කසාද'),
    PickOption('separated', 'වෙන්ව සිටී'),
  ], editable: false),
  PickListDef(PL.education, 'අධ්‍යාපනය', [
    PickOption('preschool', 'පෙර පාසල් / පාසල් නොයන ළමයා'),
    PickOption('schooling', 'දැනට පාසල් යයි'),
    PickOption('none', 'පාසල් නොගිය'),
    PickOption('g1_5', '1 – 5 ශ්‍රේණි'),
    PickOption('g6_11', '6 – 11 ශ්‍රේණි'),
    PickOption('ol', 'අ.පො.ස. සාමාන්‍ය පෙළ'),
    PickOption('al', 'අ.පො.ස. උසස් පෙළ'),
    PickOption('diploma', 'ඩිප්ලෝමා'),
    PickOption('degree', 'උපාධි'),
    PickOption('postgrad', 'පශ්චාත් උපාධි'),
  ]),
  PickListDef(PL.occupation, 'රැකියාව', [
    PickOption('govt', 'රජයේ රැකියා'),
    PickOption('private', 'පෞද්ගලික රැකියා'),
    PickOption('self', 'ස්වයං රැකියා'),
    PickOption('farmer', 'ගොවිතැන'),
    PickOption('daily_wage', 'දෛනික වැටුප්'),
    PickOption('foreign', 'විදේශ රැකියා'),
    PickOption('retired', 'විශ්‍රාමික'),
    PickOption('unemployed', 'විරැකියා'),
    PickOption('student', 'ශිෂ්‍ය'),
    PickOption('homemaker', 'ගෘහණිය'),
    PickOption('child', 'ළමයා'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.disability, 'ආබාධ', [
    PickOption('none', 'නැත'),
    PickOption('physical', 'ශාරීරික'),
    PickOption('visual', 'දෘශ්‍ය'),
    PickOption('hearing', 'ශ්‍රවණ'),
    PickOption('mental', 'මානසික'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.personStatus, 'පදිංචි තත්ත්වය', [
    PickOption('resident', 'පදිංචිව සිටී'),
    PickOption('away', 'තාවකාලිකව නැත (විදේශ / රැකියා)'),
    PickOption('moved', 'පදිංචිය හැර ගොස්'),
    PickOption('dead', 'මියගොස්'),
  ], editable: false),

  // ---------------- ගස් හා බෝග ----------------
  PickListDef(PL.treeCountSpecies, 'ගස් වර්ග (ගණනය කරන)', [
    PickOption('coconut', 'පොල්'),
    PickOption('jak', 'කොස්'),
    PickOption('breadfruit', 'දෙල්'),
    PickOption('mango', 'අඹ'),
    PickOption('arecanut', 'පුවක්'),
    PickOption('kitul', 'කිතුල්'),
    PickOption('palmyrah', 'තල්'),
    PickOption('banana', 'කෙසෙල් (පඳුරු)'),
    PickOption('pepper', 'ගම්මිරිස් (වැල්)'),
    PickOption('rambutan', 'රඹුටන්'),
    PickOption('durian', 'දූරියන්'),
    PickOption('mangosteen', 'මැංගුස්'),
    PickOption('orange', 'දොඩම්'),
    PickOption('lime', 'දෙහි'),
    PickOption('papaya', 'පැපොල්'),
    PickOption('guava', 'පේර'),
    PickOption('rose_apple', 'ජම්බු'),
    PickOption('clove', 'කරාබු නැටි'),
    PickOption('nutmeg', 'සාදික්කා'),
    PickOption('coffee', 'කෝපි'),
    PickOption('cocoa', 'කොකෝවා'),
    PickOption('rubber', 'රබර්'),
    PickOption('goraka', 'ගොරකා'),
    PickOption('avocado', 'අලිගැටපේර'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.treeSingleSpecies, 'දැව / වටිනා ගස් (තනි තනිව)', [
    PickOption('teak', 'තේක්ක'),
    PickOption('mahogany', 'මහෝගනී'),
    PickOption('jak_timber', 'කොස් (දැව)'),
    PickOption('halmilla', 'හල්මිල්ල'),
    PickOption('ebony', 'කළුවර'),
    PickOption('nadun', 'නැදුන්'),
    PickOption('burutha', 'බුරුත'),
    PickOption('kumbuk', 'කුඹුක්'),
    PickOption('hora', 'හොර'),
    PickOption('albizia', 'ඇල්බීසියා'),
    PickOption('eucalyptus', 'යුකැලිප්ටස්'),
    PickOption('bo', 'බෝ'),
    PickOption('banyan', 'නුග'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.treeCondition, 'ගසේ තත්ත්වය', [
    PickOption('healthy', 'නිරෝගී'),
    PickOption('diseased', 'රෝගී'),
    PickOption('dying', 'මැරෙමින්'),
    PickOption('dead', 'මැරී ඇත'),
  ], editable: false),
  PickListDef(PL.crop, 'බෝග', [
    PickOption('tea', 'තේ'),
    PickOption('paddy', 'වී'),
    PickOption('vegetables', 'එළවළු'),
    PickOption('cinnamon', 'කුරුඳු'),
    PickOption('maize', 'බඩඉරිඟු'),
    PickOption('finger_millet', 'කුරක්කන්'),
    PickOption('yams', 'අල වර්ග'),
    PickOption('groundnut', 'රටකජු'),
    PickOption('green_gram', 'මුං ඇට'),
    PickOption('cowpea', 'කවුපි'),
    PickOption('chilli', 'මිරිස්'),
    PickOption('onion', 'ළූණු'),
    PickOption('ginger', 'ඉඟුරු'),
    PickOption('turmeric', 'කහ'),
    PickOption('pineapple', 'අන්නාසි'),
    PickOption('fodder', 'තණකොළ'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.cropUnit, 'ඒකකය', [
    PickOption('perch', 'පර්චස්'),
    PickOption('acre', 'අක්කර'),
    PickOption('hectare', 'හෙක්ටයාර'),
    PickOption('plants', 'පැළ ගණන'),
  ], editable: false),
  PickListDef(PL.season, 'කන්නය', [
    PickOption('yala', 'යල'),
    PickOption('maha', 'මහ'),
    PickOption('both', 'යල හා මහ'),
    PickOption('perennial', 'බහු වාර්ෂික'),
  ], editable: false),
  PickListDef(PL.irrigation, 'ජල සම්පාදනය', [
    PickOption('rain', 'වැසි'),
    PickOption('irrigated', 'වාරි'),
    PickOption('well', 'ළිං'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.cultivator, 'වගා කරන්නා', [
    PickOption('owner', 'අයිතිකරු'),
    PickOption('tenant_farmer', 'අඳ ගොවියා'),
    PickOption('lessee', 'බදුකරු'),
    PickOption('other', 'වෙනත්'),
  ], editable: false),

  // ---------------- සතුන් ----------------
  PickListDef(PL.animal, 'සත්ව වර්ගය', [
    PickOption('cattle', 'ගවයින්'),
    PickOption('buffalo', 'මී හරකුන්'),
    PickOption('goat', 'එළුවන්'),
    PickOption('sheep', 'බැටළුවන්'),
    PickOption('pig', 'ඌරන්'),
    PickOption('layer', 'කුකුළන් (බිත්තර)'),
    PickOption('broiler', 'කුකුළන් (මස්)'),
    PickOption('village_chicken', 'ගම් කුකුළන්'),
    PickOption('duck', 'තාරාවන්'),
    PickOption('turkey', 'ටර්කි'),
    PickOption('quail', 'වටුවන්'),
    PickOption('dog', 'සුනඛයින්'),
    PickOption('cat', 'බළලුන්'),
    PickOption('rabbit', 'හාවුන්'),
    PickOption('bee_box', 'මී මැසි පෙට්ටි'),
    PickOption('fish_pond', 'මත්ස්‍ය පොකුණු'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.animalPurpose, 'අරමුණ', [
    PickOption('milk', 'කිරි'),
    PickOption('meat', 'මස්'),
    PickOption('eggs', 'බිත්තර'),
    PickOption('work', 'වැඩ'),
    PickOption('pet', 'සුරතල්'),
    PickOption('breeding', 'අභිජනනය'),
    PickOption('other', 'වෙනත්'),
  ]),
  PickListDef(PL.animalHousing, 'රඳවන ආකාරය', [
    PickOption('shed', 'මඩුව / කූඩුව'),
    PickOption('free', 'නිදහසේ'),
    PickOption('tethered', 'බැඳ'),
    PickOption('other', 'වෙනත්'),
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
          if (c.listName == list && c.active) PickOption(c.code, c.label),
      ];

  /// Label for a stored code. Unknown codes (e.g. a hidden custom option)
  /// still resolve, so old data keeps displaying correctly.
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
