extends GridContainer
class_name BeingGrid


@onready var being_slot: PackedScene = load("res://Being/being_slot.tscn")


@export var can_player_modifiy: bool = false
@export var grid_size: int = 3


var alive_beings: Array[BeingSlot]


func _ready() -> void:
    BattleEventBus.board_update.connect(on_board_update)
    make_grid()
    add_beings(3)
    
        
func on_board_update() -> void:
    alive_beings = []
    alive_beings.append_array(get_alive_being_slots())
        

func being_slot_by_index(index: int) -> BeingSlot:
    return alive_beings[index]
    
    
func get_first() -> BeingSlot:
    return alive_beings[0]
        
        
func get_alive_being_slots() -> Array[Node]:
    return get_children().filter(func(x: BeingSlot): return x.being_stats.is_being_slot() and x.being_stats.health.is_alive())
        

func is_dead() -> bool:
    return len(alive_beings) <= 0

        
func make_grid() -> void:
    columns = grid_size
    for x in range(grid_size):
        for y in range(grid_size):
            var coords: Vector2i = Vector2i(x, y)
            var new_being_slot: BeingSlot = being_slot.instantiate() as BeingSlot
            new_being_slot.being_slot_init(coords, can_player_modifiy)
            add_child(new_being_slot)
    
        
func print_grid() -> void:
    print(name + " Grid Print...")
    for child in alive_beings:
        var new_being_slot: BeingSlot = child as BeingSlot
        print(new_being_slot.being_stats)
    print()
        
        
func add_being() -> void:
    var texture: CompressedTexture2D = load("res://Art/icon.svg")
    
    var damage: Damage = Damage.new()
    damage.damage_init()
    
    var health: Health = Health.new()
    health.health_init()
    
    var speed: Speed = Speed.new()
    speed.speed_init()
    
    var being_type: Being_Type = Being_Type.new()
    being_type.being_type_init()
    
    var being_abilities: BeingAbilities = BeingAbilities.new()
    being_abilities.being_abilities_init()
    
    var being_stats: Dictionary = {"Texture":texture, "Damage":damage, "Health":health, "Speed":speed, "Being_Type":being_type, "Abilities":being_abilities}
    
    for child: BeingSlot in get_children():
        var current: BeingSlot = child as BeingSlot
        if !current.is_filled:
            child.set_property(being_stats)
            BattleEventBus.board_update.emit()
            break
            

func add_beings(count: int) -> void:
    var min_count = min(count, grid_size * grid_size)
    for i in range(min_count):
        add_being()
        
        
func get_grid_total_speed() -> int:
    var total = 0
    for child: BeingSlot in get_alive_being_slots():
        total += child.being_stats.speed.amount
    return total 
        
        
func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("Debug"):
        print_grid()        
