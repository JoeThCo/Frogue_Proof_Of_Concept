extends Node2D
class_name Frog_Type


enum Frog_Types {Fire, Grass, Water}
var frog_type: Frog_Types


func frog_type_init():
    frog_type = Frog_Types.values()[ randi() % Frog_Types.size()]


func _to_string() -> String:
    return Frog_Types.keys()[frog_type]
