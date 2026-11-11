extends RigidBody2D

@onready var tiles: TileMapLayer = $"../TileMapLayer"

#Soy el Jere de los comentarios :D

var direction_actual: Vector2 = Vector2.RIGHT
var direction_siguiente: Vector2 = Vector2.RIGHT #Variable Auxiliar
var move_timer: float = 0.0
@export var move_intervalo: float = 0.10 #export hace que la variable se vea en el editor (que locura)

# Presionar tecla y moverte
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") and direction_actual != Vector2.RIGHT:
		direction_siguiente = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_right") and direction_actual != Vector2.LEFT:
		direction_siguiente = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_up") and direction_actual != Vector2.DOWN:
		direction_siguiente = Vector2.UP
	elif Input.is_action_just_pressed("ui_down") and direction_actual != Vector2.UP:
		direction_siguiente = Vector2.DOWN
	
	# Aca se cronometra cuanto tarda en dar un salto a otro.
	# Si pasa mas tiempo del timer, se mueve una casilla (tile_movement)
	
	move_timer += delta
	if move_timer >= move_intervalo:
		move_timer = 0.0
		direction_actual = direction_siguiente #Actualiza la direccion la aux
		tile_movement(direction_actual)

func tile_movement(direction:Vector2):
	var current_cell=tiles.local_to_map(tiles.to_local(global_position))
	var target_cell=current_cell+Vector2i(direction)
	
	# Aca Revisa si el siguiente tile es valido (lo saque del video lol)
	if tiles.get_cell_source_id(target_cell)!=-1:
		var target_position=tiles.to_global(tiles.map_to_local(target_cell))
		global_position=target_position
	else
		get_tree().reload_current_scene() 
