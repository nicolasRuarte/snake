extends Node2D

var gameState := {
	"isGameover": false
}

var bounds

func _ready() -> void:
	bounds = get_node("Bounds")
	bounds.body_entered.connect(_on_body_entered)

func _on_body_entered(_body) -> void:
	gameState["isGameover"] = true
	print(gameState["isGameover"])
	pass
