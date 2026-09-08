class_name BloomPaint
extends RefCounted
## מלבנים עם שיפוע וברק. נראה כמו קריסטל בלי קובץ PNG.


static func gem(ci: CanvasItem, r: Rect2, col: Color, filled: bool, pulse: float = 0.0) -> void:
	if r.size.x < 2.0 or r.size.y < 2.0:
		return
	if not filled:
		ci.draw_rect(r, Color(0.055, 0.07, 0.11, 0.96))
		var well := r.grow(-2.0)
		ci.draw_rect(well, Color(0.03, 0.035, 0.055, 0.9))
		ci.draw_rect(r, Color(0.16, 0.22, 0.34, 0.55), false, 1.0)
		ci.draw_rect(Rect2(r.position + Vector2(1, 1), Vector2(r.size.x - 2.0, 2.0)), Color(1, 1, 1, 0.04))
		return
	var glow := col
	glow.a = 0.22 + pulse * 0.28
	ci.draw_rect(r.grow(2.0), glow)
	ci.draw_rect(r, col.darkened(0.18))
	var top_h: float = maxf(r.size.y * 0.22, 3.0)
	ci.draw_rect(Rect2(r.position, Vector2(r.size.x, top_h)), col.lightened(0.32))
	ci.draw_rect(Rect2(r.position, Vector2(3.0, r.size.y)), col.lightened(0.18))
	ci.draw_rect(Rect2(r.position + Vector2(0.0, r.size.y - 4.0), Vector2(r.size.x, 4.0)), col.darkened(0.38))
	var spec := Rect2(r.position + Vector2(4.0, 3.0), Vector2(r.size.x * 0.30, 3.0))
	ci.draw_rect(spec, Color(1, 1, 1, 0.32 + pulse * 0.2))
	ci.draw_rect(r, Color(col.r, col.g, col.b, 0.35 + pulse * 0.25), false, 1.2)


static func glass_panel(ci: CanvasItem, r: Rect2, fill: Color, rim: Color) -> void:
	ci.draw_rect(r.grow(2.0), Color(rim.r, rim.g, rim.b, 0.18))
	ci.draw_rect(r, fill)
	ci.draw_rect(r, rim, false, 1.4)
	ci.draw_rect(Rect2(r.position + Vector2(2, 2), Vector2(r.size.x - 4.0, 3.0)), Color(1, 1, 1, 0.08))


static func piece_cells(
	ci: CanvasItem,
	origin: Vector2,
	step: float,
	gap: float,
	cells: Array,
	col: Color,
	pulse: float = 0.0
) -> void:
	for c in cells:
		var p: Vector2 = origin + Vector2(float(c.x), float(c.y)) * (step + gap)
		gem(ci, Rect2(p, Vector2(step, step)), col, true, pulse)


static func centered_piece(
	ci: CanvasItem,
	box: Rect2,
	key: String,
	col: Color,
	pulse: float = 0.0,
	rot: int = 0
) -> void:
	var cells: Array = PieceCatalog.cells_of(key, rot)
	var wh: Vector2i = PieceCatalog.size_of(key, rot)
	var pad := 14.0
	var usable: float = minf(box.size.x, box.size.y) - pad * 2.0
	var span: float = float(maxi(wh.x, wh.y))
	var step: float = usable / maxf(span, 1.0)
	var gap := maxf(step * 0.08, 1.5)
	step -= gap
	var pw: float = float(wh.x) * (step + gap) - gap
	var ph: float = float(wh.y) * (step + gap) - gap
	var o := box.position + (box.size - Vector2(pw, ph)) * 0.5
	piece_cells(ci, o, step, gap, cells, col, pulse)
