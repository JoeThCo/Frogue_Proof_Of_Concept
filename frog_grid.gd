extends GridContainer
class_name Frog_Grid


@onready var frogue: PackedScene = load("res://frogue.tscn")


const GRID_SIZE: int = 3


func _ready() -> void:
    columns = GRID_SIZE
    for i in range(GRID_SIZE * GRID_SIZE):
        var frog_slot: Frog_Slot = frogue.instantiate()
        if randi() % 2 == 0:
            var frog: Frog_Data = Frog_Data.new()
            frog.frog_init_random()
            frog_slot.frogue_init(frog, i)
        else:
            frog_slot.remove_texture()
        add_child(frog_slot)
