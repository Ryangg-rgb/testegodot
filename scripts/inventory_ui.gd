extends Control

@onready var slot_labels: Array[Label] = [
    $HBoxContainer/Slot1,
    $HBoxContainer/Slot2,
    $HBoxContainer/Slot3,
    $HBoxContainer/Slot4,
    $HBoxContainer/Slot5
]

var slot_keys := ["wood", "", "", "", ""] # slot 1 mostra madeira

func _ready() -> void:
    Inventory.updated.connect(_refresh)
    _refresh()

func _refresh() -> void:
    for i in slot_labels.size():
        var key := slot_keys[i]
        if key == "":
            slot_labels[i].text = "[vazio]"
        else:
            slot_labels[i].text = "%s: %d" % [key, Inventory.get_count(key)]