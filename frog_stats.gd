extends TextureRect


var damage: int = 0:
    set(value):
        damage = value
        

@onready var property: Dictionary = {"TEXTURE": texture,
                                     "DAMAGE": damage}:
        set(value):
            property = value

            texture = property["TEXTURE"]
            damage = property["DAMAGE"]
