extends TextureRect
class_name Frog_Stats


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
                
            
func _to_string() -> String:
    return "Damage:{0} | Health:{1} | FrogType:{2}".format([str(damage), str(health), str(frog_type)])
