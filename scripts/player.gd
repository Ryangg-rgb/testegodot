extends CharacterBody2D

const SPEED := 200.0
const JUMP_VELOCITY := -350.0
const GRAVITY := 900.0

var nearby_targets: Array = [] # árvores próximas (StaticBody2D dos troncos)

func _ready() -> void:
    var area := $InteractArea
    area.body_entered.connect(_on_body_entered)
    area.body_exited.connect(_on_body_exited)

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y += GRAVITY * delta

    var dir := 0.0
    if Input.is_action_pressed("move_left"):
        dir -= 1.0
    if Input.is_action_pressed("move_right"):
        dir += 1.0
    velocity.x = dir * SPEED

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    if Input.is_action_just_pressed("interact"):
        _try_chop()

    move_and_slide()

func _on_body_entered(body: Node) -> void:
    var tree := _resolve_tree_from_body(body)
    if tree != null and not nearby_targets.has(tree):
        nearby_targets.append(tree)

func _on_body_exited(body: Node) -> void:
    var tree := _resolve_tree_from_body(body)
    if tree != null:
        nearby_targets.erase(tree)

func _resolve_tree_from_body(body: Node) -> Node:
    if body.get_parent() and body.get_parent().is_in_group("choppable"):
        return body.get_parent()
    if body.is_in_group("choppable"):
        return body
    return null

func _try_chop() -> void:
    if nearby_targets.size() > 0:
        var tree = nearby_targets[0]
        if tree and tree.has_method("take_hit"):
            tree.take_hit()