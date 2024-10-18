extends Area2D


export var speed = 400 #velocitat del jugadro
var screen_size


func _ready():
	screen_size = get_viewport_rect().size
