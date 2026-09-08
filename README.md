# BloomGrid

פאזל בלוקים 8×8 (hybrid-casual). Godot 4.7, יעד Android API 36.  
גרור שלושה חלקים ללוח. שורה או עמודה מלאה מתנקה. שתיהן יחד = סופרנובה.

## איך זה בנוי

- `core/` — חוקים בלבד (`RefCounted`). בלי Node, בלי מגע, בלי קבצים.
- `game/` — מה שרואים: גרירה, פיצוצים, HUD, שמירה מקומית.
- `tests/` + `tools/test_core.py` — אותה לוגיקה נבדקת פעמיים (Godot headless ופייתון).

Classic בלי שעון. Race עם זמן ובונוס על הצלחה. Spin פעמיים לריצה. שם שחקן אופציונלי, נשמר במכשיר.

## לשחק

```powershell
& "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\GodotEngine.GodotEngine_Microsoft.Winget.Source_8wekyb3d8bbwe\Godot_v4.7.2-stable_win64.exe" --path C:\Users\noam1\Documents\game-c-bloomgrid
```

## טסטים

```powershell
python tools/test_core.py
godot --headless --path . -s res://tests/run_suite.gd
```

## חנויות

טיוטות ב-`store-ops/`. אין תשלום Play / AdMob / Publish בלי אדם — `HUMAN_STOP.md`.
