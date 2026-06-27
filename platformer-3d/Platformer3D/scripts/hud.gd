extends CanvasLayer

func _on_coin_collected(coins):
	# TODO 5: Actualitza el número de monedes a la interfície
	# <SOL>
	$Coins.text = str(coins)
	# </SOL>
