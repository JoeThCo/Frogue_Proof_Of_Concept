extends TextureRect
class_name Being_Stats


var damage: Damage
var health: Health
var frog_type: Frog_Type


@onready var property: Dictionary = {"Texture": null,
                                     "Damage": null,
                                    "Health": null,
                                    "Frog_Type": null}:
        set(value):
            property = value

            texture = property["Texture"]
            damage = property["Damage"]
            health = property["Health"]
            frog_type = property["Frog_Type"]
            
            if frog_type:
                modulate = frog_type.get_color()
                
                
func _ready() -> void:
   # tween_back_and_forth.call_deferred(Vector2.ZERO, 2)
    pass
              

func _to_string() -> String:
    return "Damage:{0} | Health:{1} | FrogType:{2}".format([str(damage), str(health), str(frog_type)])
    

func tween_back_and_forth(pos: Vector2, total_time: float) ->void:
    var init_pos: Vector2 = global_position

    var to_tween: Tween = get_tree().create_tween()
    to_tween.tween_property(self, "global_position", pos, total_time * 0.5)
    await to_tween.finished
    
    var from_tween: Tween = get_tree().create_tween()
    from_tween.tween_property(self, "global_position", init_pos - global_position, total_time * 0.5)
    await from_tween.finished
