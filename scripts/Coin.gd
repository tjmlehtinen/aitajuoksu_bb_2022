extends Area

func _on_Coin_body_entered(body):
	ScoreEvents.add_coins(1)
	queue_free()
