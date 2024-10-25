extends CanvasLayer
signal start_game

func show_message(text):
	print(text)
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
# Espereu fins que el MessageTimer hagi acabat de comptar.
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
# Feu un temporitzador one-shot i espereu que acabi.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_MessageTimer_timeout():
	$Message.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
