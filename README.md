# SmartGrama — Flutter යෙදුම

ග්‍රාම නිලධාරී වසමේ ඉඩම්, ගොඩනැගිලි, පවුල්, පුද්ගලයින්, ගස්, බෝග, සතුන් අලුතින් නිවැරදිව ඇතුළත් කර බැලීමේ offline යෙදුම.
අවශ්‍යතා ලේඛනය: [../docs/SmartGrama-ලේඛනය.md](../docs/SmartGrama-ලේඛනය.md)

## ධාවනය

```bash
flutter pub get
dart run build_runner build      # lib/data/database.g.dart
flutter run                      # සම්බන්ධ දුරකථනයක / simulator එකක
flutter test                     # NIC, ඒකක, සංකේතනය, උපස්ථය, විශ්ලේෂණ
```

Debug build එකේ **සැකසුම් → ආදර්ශ දත්ත එකතු කරන්න** මඟින් පරීක්ෂණ දත්ත ලබා ගත හැක (release build එකේ නොපෙන්වයි).

## ව්‍යුහය

| ෆෝල්ඩරය | අන්තර්ගතය |
|---------|-----------|
| `lib/data/database.dart` | Drift වගු (ඉඩම් → ගොඩනැගිලි → පවුල් → පුද්ගලයින්; ගස්, බෝග, සතුන්, ඡායාරූප), `saveRow` (සෑම වෙනස්කමක්ම `change_logs` වෙත), soft delete |
| `lib/data/bundle.dart` | එක් ඉඩමක (`LandBundle`) හා මුළු වසමේ (`Snapshot`) දත්ත පූරණය, `watchLoad` |
| `lib/data/analytics.dart` | සම්පූර්ණත්වය හා අනතුරු ඇඟවීම්, සංඛ්‍යාලේඛන, සමීක්ෂණ ප්‍රගතිය, සූදානම් ලැයිස්තු, දත්ත ගුණාත්මකභාවය |
| `lib/data/picklists.dart` | සියලු තේරීම් ලැයිස්තු (කේත + සිංහල නම්) |
| `lib/data/nic.dart`, `units.dart` | හැඳුනුම්පත් විග්‍රහය, අක්-රූ-පර් / හෙක්ටයාර පරිවර්තනය |
| `lib/data/backup.dart` | මුරපදයෙන් සංකේතිත උපස්ථය (ඡායාරූප සමඟ) හා ප්‍රතිස්ථාපනය |
| `lib/security/` | PIN, ඇඟිලි සලකුණ, දත්ත ගබඩා යතුර (Keystore/Keychain) |
| `lib/ui/` | තිර (මුල් පිටුව, ඉඩම් කාඩ්පත, wizard, ෆෝම්, සෙවීම, සිතියම, වාර්තා, සැකසුම්) |

## ආරක්ෂාව

- මුළු දත්ත ගබඩාවම SQLite3MultipleCiphers මඟින් සංකේතිතයි (`pubspec.yaml` → `hooks.user_defines.sqlite3.source: sqlite3mc`). යතුර දුරකථනයේ Keystore/Keychain හි පමණි.
- Android ස්වයංක්‍රීය backup අක්‍රියයි (`allowBackup="false"`) — දත්ත ආපසු ගැනීමට යෙදුමේ උපස්ථය භාවිත කරන්න.
- ඡායාරූප යෙදුමේ පෞද්ගලික ෆෝල්ඩරයේ (දුරකථන ගැලරියට නොයයි). ගොනු මට්ටමේ සංකේතනය තවම නැත.

## Release එකකට පෙර

- `applicationId` / Bundle ID තවම `com.example.smartgrama` — නිසි ID එකකට වෙනස් කරන්න.
- Android release signing key සකසන්න.
- සිතියම OpenStreetMap tiles අන්තර්ජාලයෙන් ලබා ගනී; offline tiles දෙවන අදියරේ.
