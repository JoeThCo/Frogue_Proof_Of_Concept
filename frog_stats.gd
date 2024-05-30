extends TextureRect


@export var damage: int = 5:
    set(value):
        damage = value
        $Debug.text = str(damage)


@onready var property: Dictionary = {"TEXTURE": texture,
                                     "DAMAGE": damage}:
        set(value):
            property = value

            texture = property["TEXTURE"]
            damage = property["DAMAGE"]
