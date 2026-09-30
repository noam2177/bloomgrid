# משחק מהטלפון — BloomGrid

BloomGrid כבר בנוי לנייד ב-Godot: מסך 720×1280, אוריינטציה אנכית, מגע (`InputEventScreenTouch`), ורנדרר `mobile`.

## אנדרואיד (מומלץ לשחקנים)

1. התקן [Godot 4.7](https://godotengine.org/) ו־Android build template (Editor → Manage Export Templates).
2. התקן JDK 17 ו־Android SDK; ב־Godot: Editor → Editor Settings → Export → Android.
3. ייצוא:

```powershell
cd C:\Users\noam1\Documents\game-c-bloomgrid
godot --headless --export-release "Android" build\bloomgrid.aab
```

4. להתקנה ישירה (בדיקה): שנה ב־`export_presets.cfg` נתיב ל־`build/bloomgrid.apk` ו־`export_format=0`, או ייצא APK מהעורך.
5. העבר את הקובץ לטלפון והתקן (מקור לא ידוע מותר).

## דפדפן (בלי חנות)

1. הוסף Web export template ב־Godot.
2. הרץ:

```powershell
.\tools\export_web.ps1
```

3. העלה תיקיית `build/web/` ל-GitHub Pages או לכל שרת סטטי.
4. פתח בכרום/ספארי בנייד; הוסף למסך הבית (PWA) אם תרצה.

## בדיקה מהירה על אותו Wi‑Fi

```powershell
python -m http.server 8792 --directory build\web
```

בטלפון: `http://<כתובת-IP-של-המחשב>:8792`
