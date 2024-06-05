extends TextureRect
class_name Being_Stats


var damage: Damage
var health: Health
var speed: Speed
var being_type: Being_Type


@onready var property: Dictionary = {"Texture": null,
                                     "Damage": null,
                                    "Health": null,
                                    "Speed" : null,
                                    "Being_Type": null}:
        set(value):
            property = value

            texture = property["Texture"]
            damage = property["Damage"]
            health = property["Health"]
            speed = property["Speed"]
            being_type = property["Being_Type"]
            
            if being_type:
                modulate = being_type.get_color()
            
            if health:
                health.health_under_zero.connect(on_health_under_zero)               
            
                
func on_health_under_zero():
    print("Dead!")
    texture = null
                
                
func get_speed() -> int:
    return speed.amount        
    
    
func apply_damage(other_damage: Damage):
    health.take_damage(other_damage)

            
func is_being_slot() -> bool:
    return damage == null and texture == null and health == null and being_type == null and speed == null
    

func _to_string() -> String:
    return "Damage: {0} | Health: {1} | Speed: {2} | Being_Type: {3}".format([str(damage), str(health), str(speed), str(being_type)])
    
    
func damage_tween(other_being_slot: Being_Slot, total_time: float) -> void:
    var from_position: Vector2 = global_position

    var to_tween: Tween = get_tree().create_tween()
    to_tween.tween_property(self, "global_position", other_being_slot.global_position, total_time * 0.5)
    await to_tween.finished
    
    print(other_being_slot.being_stats)
    other_being_slot.being_stats.apply_damage(damage)
    print(other_being_slot.being_stats)
    
    var from_tween: Tween = get_tree().create_tween()
    from_tween.tween_property(self, "global_position", from_position, total_time * 0.5)
    await from_tween.finished
