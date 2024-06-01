extends Node2D
class_name Being_Type


enum Being_Types {Fire, Grass, Water}
var being_colors: Array[Color] = [Color.ORANGE_RED, Color.WEB_GREEN, Color.ROYAL_BLUE]
var being_type: Being_Types


func being_type_init() -> void:
    being_type = Being_Types.values()[ randi() % Being_Types.size()]


func _to_string() -> String:
    return Being_Types.keys()[being_type]
    
    
func get_color() -> Color:
    return being_colors[being_type]
