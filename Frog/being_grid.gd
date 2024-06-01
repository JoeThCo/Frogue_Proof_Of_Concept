extends GridContainer
class_name Being_Grid


@onready var frog_slot: PackedScene = load("res://Frog/being_slot.tscn")


const GRID_SIZE: int = 3


func _ready() -> void:
    make_grid()
    add_frogs(4)
    
        
func make_grid() -> void:
    columns = GRID_SIZE
    for i in range(GRID_SIZE * GRID_SIZE):
        var new_frog_slot: Being_Slot = frog_slot.instantiate() as Being_Slot
        add_child(new_frog_slot)
        
    
func print_grid() -> void:
    print("New Grid Print...")
    for child in get_children():
        var temp_frog_slot: Being_Slot = child as Being_Slot
        print(temp_frog_slot.texture_rect)
        
        
func add_frog() -> void:
    var texture: CompressedTexture2D = load("res://Art/icon.svg")
    
    var damage: Damage = Damage.new()
    damage.damage_init((randi() % 5) + 1)
    
    var health: Health = Health.new()
    health.health_init((randi() % 3) + 1)
    
    var frog_type: Frog_Type = Frog_Type.new()
    frog_type.frog_type_init()
    
    var frog_data: Dictionary = {"Texture": texture, "Damage": damage, "Health" : health, "Frog_Type": frog_type}
    
    for child: Being_Slot in get_children():
        var current: Being_Slot = child as Being_Slot
        if !current.is_filled:
            child.set_property(frog_data)
            break
            

func add_frogs(count: int) -> void:
    var min_count = min(count, GRID_SIZE * GRID_SIZE)
    print(min_count)
    for i in range(min_count):
        add_frog()
        
        
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("Debug"):
        print_grid()        
