extends CanvasLayer

func _on_coin_collected(coins):
	# TODO 5: Actualitza el número de monedes a la interfície
	#   - Assigna a la propietat '.text' del node de monedes ($Coins) el valor de monedes.
	#   - Converteix el valor numèric a text amb la funció: str(coins)
	# <SOL>
	$Coins.text = str(coins)
	# </SOL>
