extends CanvasLayer

func _on_coin_collected(coins):
	# TODO 4: Actualitza el número de monedes
	$Coins.text = str(coins)
