extends Control

#Setting inital coin to 0
#Whenever clicker is clicked, add coins

var coin: int
@export var power: int
@onready var coin_label: Label = $CoinLabel #what shows amount of coins
@onready var str_label: Label = $StrengthLabel #what shows power of clicks
@onready var auto_label: Label = $AutoLabel #what shows auto generated coins
@onready var win_screen: TextureRect = $"You Win"
var auto: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin = 0 #initiaes values to 0
	auto = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Receiver for clicking button
func _on_button_down() -> void:
	coin += power #increases your amount of coins
	coin_label.text = "Coin: " +str(coin)
	#print(coin) #for debugging


func _on_upgrade_button_button_down() -> void:
	if coin>=15: #So you can't go in the negatives
		power += 1 #increases power of clicks
		coin -= 15 #Arbitrarily picked cost
		coin_label.text = "Coin: " +str(coin) #So it outputs your new total
		str_label.text = "Str: " +str(power)
	


func _on_auto_upgrade_button_button_down() -> void:
	if coin >= 50: 
		auto+=1 #auto generated clicks per second increment by 1
		coin-=50
		coin_label.text = "Coin: " +str(coin) #updates values on screen
		auto_label.text = "Auto Clickers: " +str(auto)



func _on_timer_timeout() -> void: #timer is set to 1s, autostart, and no one time
	if auto >= 1:
		coin += auto
		coin_label.text = "Coin: " +str(coin)


func _on_debug_infinite_money_button_down() -> void: #adds money to test things
	if coin == 10000: #if it's pressed twice in a row, resets your coin progress
		coin = 0
	else:
		coin = 10000


func _on_buy_a_win_button_button_down() -> void:
	if coin >= 1000: #how much it costs to win
		coin -= 1000
		win_screen.visible = true #displays the illustrious win screen (which should be on top layer)
