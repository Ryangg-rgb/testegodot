extends Node

# Registra ações básicas de input se não existirem.
func _ready() -> void:
    _ensure_action("move_left", [KEY_A, KEY_LEFT])
    _ensure_action("move_right", [KEY_D, KEY_RIGHT])
    _ensure_action("jump", [KEY_SPACE, KEY_W, KEY_UP])
    _ensure_action("interact", [KEY_E])

func _ensure_action(action_name: String, keycodes: Array) -> void:
    if not InputMap.has_action(action_name):
        InputMap.add_action(action_name)
    for code in keycodes:
        if not _has_keybound(action_name, code):
            var ev := InputEventKey.new()
            ev.physical_keycode = code
            InputMap.action_add_event(action_name, ev)

func _has_keybound(action_name: String, keycode: int) -> bool:
    for ev in InputMap.action_get_events(action_name):
        if ev is InputEventKey and ev.physical_keycode == keycode:
            return true
    return false