extends Node
signal updated

var items := {} # {String: int}

func add_item(id: String, amount: int = 1) -> void:
    items[id] = (items.get(id, 0) as int) + amount
    emit_signal("updated")

func get_count(id: String) -> int:
    return items.get(id, 0)