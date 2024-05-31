extends PanelContainer
class_name Frog_Slot


@export var frog_stats: Frog_Stats


var is_filled: bool = false


#to get data that can be dragged and dropped onto controls that expect drop data
func _get_drag_data(_at_position: Vector2) -> Variant:
    set_drag_preview(get_preview())
    return frog_stats
    
    
#to test if data from a control's _get_drag_data() can be dropped at at_position
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data is TextureRect
    

# to pass you the data from a control's _get_drag_data() result
func _drop_data(_at_position: Vector2, data: Variant) -> void:
    var temp = frog_stats.property
    frog_stats.property = data.property
    data.property = temp
    

func get_preview() -> Control:
    var preview_texture: TextureRect = TextureRect.new()
    preview_texture.texture = frog_stats.texture
    preview_texture.modulate = frog_stats.frog_type.get_color()
    preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
    preview_texture.size = Vector2.ONE * 25
    
    var preview: Control = Control.new()
    preview.add_child(preview_texture)
    return preview
    
    
func set_property(frog_data: Dictionary) -> void:
    frog_stats.property = frog_data
    is_filled = frog_stats.property["Texture"] != null
