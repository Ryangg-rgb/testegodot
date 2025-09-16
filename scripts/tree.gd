extends Node2D

@export var max_hp := 3
var hp := 0

func _ready() -> void:
    hp = max_hp

func take_hit() -> void:
    hp -= 1
    # Efeito simples: sacudir um pouco
    var t := create_tween()
    var shake := randf() * 6.0 - 3.0
    t.tween_property(self, "rotation_degrees", rotation_degrees + shake, 0.08).set_ease(Tween.EASE_OUT)
    if hp <= 0:
        _fell()

func _fell() -> void:
    # Anima "queda" simples e remove
    var t := create_tween()
    t.tween_property(self, "rotation_degrees", 90.0, 0.25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
    t.tween_callback(_on_fell_done)

func _on_fell_done() -> void:
    Inventory.add_item("wood", 1)
    queue_free()