extends Node2D
class_name Frog_Type


enum Frog_Types {Fire, Grass, Water}
var frog_colors: Array[Color] = [Color.ORANGE_RED, Color.WEB_GREEN, Color.ROYAL_BLUE]
var frog_type: Frog_Types


func frog_type_init() -> void:
    frog_type = Frog_Types.values()[ randi() % Frog_Types.size()]


func _to_string() -> String:
    return Frog_Types.keys()[frog_type]
    
    
func get_color() -> Color:
    return frog_colors[frog_type]
