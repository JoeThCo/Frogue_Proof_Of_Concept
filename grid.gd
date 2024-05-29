extends GridContainer
class_name Frogue_Grid


@onready var frogue: PackedScene = load("res://frogue.tscn")


@export var grid_size: Vector2i = Vector2i.ONE * 3


func _ready() -> void:
    columns = grid_size.x
    for y in range(grid_size.y):
        for x in range(grid_size.x):   
            var new_frogue: Frogue = frogue.instantiate()
            new_frogue.frogue_init()
            if x != 0 or y != 0:
                new_frogue.remove_texture()
            add_child(new_frogue)
