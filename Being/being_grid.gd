extends GridContainer
class_name Being_Grid


@onready var being_slot: PackedScene = load("res://Frog/being_slot.tscn")


@export var can_player_modifiy: bool = false
@export var grid_size: int = 3


func _ready() -> void:
    make_grid()
    add_beings(4)
    
        
func make_grid() -> void:
    columns = grid_size
    for i in range(grid_size * grid_size):
        var new_being_slot: Being_Slot = being_slot.instantiate() as Being_Slot
        new_being_slot.being_slot_init(can_player_modifiy)
        add_child(new_being_slot)
        
        
func print_grid() -> void:
    print("New Grid Print...")
    var test_children = get_children().filter(func(x: Being_Slot): return !x.being_stats.is_being_slot()) as Array[Being_Slot]
    for child in test_children:
        var new_being_slot: Being_Slot = child as Being_Slot
        print(new_being_slot.being_stats)
        
        
func add_being() -> void:
    var texture: CompressedTexture2D = load("res://Art/icon.svg")
    
    var damage: Damage = Damage.new()
    damage.damage_init()
    
    var health: Health = Health.new()
    health.health_init()
    
    var being_type: Being_Type = Being_Type.new()
    being_type.being_type_init()
    
    var being_stats: Dictionary = {"Texture": texture, "Damage": damage, "Health" : health, "Being_Type": being_type}
    
    for child: Being_Slot in get_children():
        var current: Being_Slot = child as Being_Slot
        if !current.is_filled:
            child.set_property(being_stats)
            break
            

func add_beings(count: int) -> void:
    var min_count = min(count, grid_size * grid_size)
    print(min_count)
    for i in range(min_count):
        add_being()
        
        
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("Debug"):
        print_grid()        
