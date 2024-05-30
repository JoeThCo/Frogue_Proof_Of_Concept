extends TextureRect


@export var damage: Damage
@export var health: Health


@onready var property: Dictionary = {"TEXTURE": texture,
                                     "DAMAGE": null,
                                    "HEALTH": null}:
        set(value):
            property = value

            texture = property["TEXTURE"]
            damage = property["DAMAGE"]
            health = property["HEALTH"]
            
