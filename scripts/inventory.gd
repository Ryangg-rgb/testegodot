extends Node
signal updated

var items := {} # {String: int}

func _ready() -> void:
    # Itens iniciais
    if items.get("axe", 0) == 0:
        add_item("axe", 1)

func add_item(id: String, amount: int = 1) -> void:
    items[id] = (items.get(id, 0) as int) + amount
    emit_signal("updated")

func get_count(id: String) -> int:
    return items.get(id, 0)

func has_item(id: String, min_amount: int = 1) -> bool:
    return get_count(id) >= min_amount
