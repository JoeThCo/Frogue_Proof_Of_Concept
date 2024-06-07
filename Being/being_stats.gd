extends TextureRect
class_name BeingStats


@export var being_slot: BeingSlot


var damage: Damage
var health: Health
var speed: Speed
var type: Being_Type
var abilities: BeingAbilities


@onready var property: Dictionary = {"Texture": null,
                                     "Damage": null,
                                    "Health": null,
                                    "Speed" : null,
                                    "Being_Type": null,
                                    "Abilities": null}:
        set(value):
            property = value

            texture = property["Texture"]
            damage = property["Damage"]
            health = property["Health"]
            speed = property["Speed"]
            type = property["Being_Type"]
            abilities = property["Abilities"]
            
            if type:
                modulate = type.get_color()
            
            if health and !health.health_under_zero.is_connected(on_health_under_zero):
                health.health_under_zero.connect(on_health_under_zero)               
            
                
func on_health_under_zero():
    print("Dead!")
    texture = null
                
                
func get_grid_coords() -> Vector2i:
    return being_slot.grid_coords
                
                
func get_speed() -> int:
    return speed.amount        
    
    
func apply_damage(other_damage: Damage):
    health.take_damage(other_damage)
    
    
func is_same_col(other_slot: BeingSlot) -> bool:
    return being_slot.grid_coords.y == other_slot.grid_coords.y


func is_same_row(other_slot: BeingSlot) -> bool:
    return being_slot.grid_coords.x == other_slot.grid_coords.x
    

func is_same_type(other_slot: BeingSlot) -> bool:
    return type.being_type == other_slot.being_stats.type.being_type 
    
            
func is_being_slot() -> bool:
    return property and  damage and texture and health and type and speed
    

func _to_string() -> String:
    return "Damage: {0} | Health: {1} | Speed: {2} | Being_Type: {3} | {4}".format([str(damage), str(health), str(speed), str(type),str(get_grid_coords())])
    
    
func battle_tween(other_slot: BeingSlot, total_time: float) -> void:
    var from_position: Vector2 = global_position

    var to_tween: Tween = get_tree().create_tween()
    to_tween.tween_property(self, "global_position", other_slot.global_position, total_time * 0.5)
    await to_tween.finished

    other_slot.being_stats.apply_damage(damage)
    print(other_slot.being_stats.health)
    
    var from_tween: Tween = get_tree().create_tween()
    from_tween.tween_property(self, "global_position", from_position, total_time * 0.5)
    await from_tween.finished
    
    
func ability_tween(total_time: float) -> void:
    var in_tween: Tween = get_tree().create_tween()
    in_tween.tween_property(self, "scale", Vector2.ONE * 1.25, total_time * 0.5)
    await in_tween.finished
    
    var out_tween: Tween = get_tree().create_tween()
    out_tween.tween_property(self, "scale",Vector2.ONE, total_time * 0.5)
    await out_tween.finished
