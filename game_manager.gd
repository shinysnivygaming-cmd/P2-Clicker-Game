extends Control

#Setting inital coin to 0
#Whenever clicker is clicked, add coins

var coin: int
@export var power: int
@onready var coin_label: Label = $CoinLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Receiver for clicking button
func _on_button_down() -> void:
	coin += power
	coin_label.text = "Coin: " +str(coin)
	print(coin)



func _on_upgrade_button_button_down() -> void:
	power += 1
	print("Current Power:")
	print(power)
	
