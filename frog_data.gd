extends Node
class_name Frog_Data

var color: Color = Color.TRANSPARENT
var health: int = 5
var damage: int = 3
var speed: int = 1


var colors = [Color(1.0, 0.0, 0.0, 1.0),
          Color(0.0, 1.0, 0.0, 1.0),
          Color(0.0, 0.0, 1.0, 1.0)]


func frog_init_all(in_health: int, in_damage: int, in_speed: int):
    self.health = in_health
    self.damage = in_damage
    self.speed = in_speed
    self.color = colors[randi() % colors.size()]


func frog_init_random():
    self.health = (randi() % 5) + 1
    self.damage = (randi() % 5) + 1
    self.speed = (randi() % 5) + 1
    self.color = colors[randi() % colors.size()]
    
    
func _to_string() -> String:
    return str(health) + " " + str(damage) + " " + str(speed)
