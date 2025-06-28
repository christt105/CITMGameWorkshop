extends Node2D

@onready var lasers = $Lasers
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var game_over_screen = $UI/GameOverScreen
@onready var player_spawn_pos = $PlayerSpawnPos
@onready var player_spawn_area = $PlayerSpawnPos/PlayerSpawnArea
@onready var asteroid_spawner: AsteroidSpawner = $AsteroidSpawner

var score := 0:
	set(value):
		score = value
		hud.score = score


func _ready():
	game_over_screen.visible = false
	score = 0
	player.connect("laser_shot", _on_player_laser_shot)
	player.connect("died", _on_player_died)
	asteroid_spawner.asteroid_exploded.connect(_on_asteroid_exploded)


func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_player_laser_shot(laser):
	$LaserSound.play()
	lasers.add_child(laser)


func _on_player_died():
	$PlayerDieSound.play()
	player.global_position = player_spawn_pos.global_position
	await get_tree().create_timer(2).timeout
	game_over_screen.visible = true


func _on_asteroid_exploded(points: int) -> void:
	score += points
