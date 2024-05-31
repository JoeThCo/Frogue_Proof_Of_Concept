extends GridContainer
class_name Frog_Grid


@onready var frog_slot: PackedScene = load("res://frog_slot.tscn")


const GRID_SIZE: int = 3


func _ready() -> void:
    make_grid()
    add_frog()
    add_frog()
        
        
func make_grid():
    columns = GRID_SIZE
    for i in range(GRID_SIZE * GRID_SIZE):
        var new_frog_slot: Frog_Slot = frog_slot.instantiate() as Frog_Slot
        add_child(new_frog_slot)
        
    
func print_grid():
    print("New Grid Print...")
    for child in get_children():
        var temp_frog_slot: Frog_Slot = child as Frog_Slot
        print(temp_frog_slot.texture_rect)
        
        
func add_frog():
    var texture: CompressedTexture2D = load("res://icon.svg")
    
    var damage: Damage = Damage.new()
    damage.damage_init((randi() % 5) + 1)
    
    var health: Health = Health.new()
    health.health_init((randi() % 3) + 1)
    
    var frog_type: Frog_Type = Frog_Type.new()
    frog_type.frog_type_init()
    
    var frog_data: Dictionary = {"Texture": texture, "Damage": damage, "Health" : health, "Frog_Type": frog_type}
    
    for child: Frog_Slot in get_children():
        var current: Frog_Slot = child as Frog_Slot
        if !current.is_filled:
            print(current.is_filled)
            child.set_property(frog_data)
            break
        
        
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("Debug"):
        print_grid()        
