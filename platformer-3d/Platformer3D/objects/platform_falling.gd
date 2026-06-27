extends Node3D

var falling := false
var gravity := 0.0
@export var falling_speed := 25.0

func _process(delta):
	scale = scale.lerp(Vector3(1, 1, 1), delta * 10) # Animate scale
	
	# TODO 6: Fes que caigui la plataforma si s'ha activat 'falling' (aplica gravetat i resta la posició Y)
	#   - Comprova si 'falling' és cert amb un condicional: if falling:
	#   - Si és cert:
	#     1. Incrementa la velocitat de caiguda aplicant gravetat: gravity += falling_speed * delta
	#     2. Resta aquest efecte de la coordenada Y per desplaçar-la cap avall: position.y -= gravity * delta
	# <SOL>
	if falling:
		gravity += falling_speed * delta
		position.y -= gravity * delta
	# </SOL>
	
	if position.y < -10:
		queue_free() # Remove platform if below threshold



func _on_body_entered(_body):
	if !falling:
		Audio.play("res://sounds/fall.ogg") # Play sound
		scale = Vector3(1.25, 1, 1.25) # Animate scale
	
	# TODO 7: Quan el jugador toqui la plataforma, activa la variable 'falling' a true
	#   - Assigna a la variable booleana 'falling' el valor de 'true'.
	# <SOL>
	falling = true
	# </SOL>
