extends PanelContainer
class_name Frogue


@export var texture_rect: TextureRect 


func frogue_init():
    pass


func _get_drag_data(_at_position: Vector2) -> Variant:
    set_drag_preview(get_preview())
    return texture_rect
    
    
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data is TextureRect
    
    
func _drop_data(_at_position: Vector2, data: Variant) -> void:
    var temp: Texture = texture_rect.texture
    texture_rect.texture = data.texture
    data.texture = temp
    

func get_preview():
    var preview_texture: TextureRect = TextureRect.new()
    preview_texture.texture = texture_rect.texture
    preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
    preview_texture.size = Vector2.ONE * 25
    
    var preview: Control = Control.new()
    preview.add_child(preview_texture)
    
    return preview
    
    
func remove_texture():
    texture_rect.texture = null
