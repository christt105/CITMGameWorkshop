class_name AsteroidSpawner extends Node2D

@onready var asteroid_spawn_timer: Timer = $AsteroidSpawnTimer
@onready var asteroid_spawn_location: PathFollow2D = $AsteroidPath/AsteroidSpawnLocation
@onready var asteroids: Node2D = $Asteroids

const ASTEROID_LARGE = preload("res://scenes/asteroids/asteroid_large.tscn")
const ASTEROID_MEDIUM = preload("res://scenes/asteroids/asteroid_medium.tscn")
const ASTEROID_SMALL = preload("res://scenes/asteroids/asteroid_small.tscn")

signal asteroid_exploded(points:int)

func _ready() -> void:
	asteroid_spawn_timer.timeout.connect(_on_AsteroidSpawnTimer_timeout)
	
	for i in range(5):
		asteroid_spawn_location.progress_ratio = randf()
		spawn_asteroid(asteroid_spawn_location.global_position, Asteroid.AsteroidSize.LARGE)

func _on_AsteroidSpawnTimer_timeout():
	asteroid_spawn_location.progress_ratio = randf()
	spawn_asteroid(asteroid_spawn_location.global_position, Asteroid.AsteroidSize.LARGE)


func spawn_asteroid(pos:Vector2, size:Asteroid.AsteroidSize):
	var asteroid_scene = get_asteroid_scene_by_size(size)
	if asteroid_scene != null:
		var asteroid = asteroid_scene.instantiate()
		asteroid.global_position = pos
		asteroids.call_deferred("add_child", asteroid)
		asteroid.connect("exploded", _on_asteroid_exploded)

func _on_asteroid_exploded(pos, size, points):
	$AsteroidHitSound.play()
	
	asteroid_exploded.emit(points)
	
	for i in range(2):
		match size:
			Asteroid.AsteroidSize.LARGE:
				spawn_asteroid(pos, Asteroid.AsteroidSize.MEDIUM)
			Asteroid.AsteroidSize.MEDIUM:
				spawn_asteroid(pos, Asteroid.AsteroidSize.SMALL)
			Asteroid.AsteroidSize.SMALL:
				pass


func get_asteroid_scene_by_size(size:Asteroid.AsteroidSize) -> PackedScene:
	var scene = null
	
	match size:
		Asteroid.AsteroidSize.LARGE:
			scene = ASTEROID_LARGE
		Asteroid.AsteroidSize.MEDIUM:
			scene = ASTEROID_MEDIUM
		Asteroid.AsteroidSize.SMALL:
			scene = ASTEROID_SMALL
	
	return scene
