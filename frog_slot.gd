extends PanelContainer
class_name Frog_Slot


@export var texture_rect: TextureRect 


var frog: Frog_Data
var index: int


func frogue_init(in_frog: Frog_Data, in_index: int):
    frog = in_frog
    index = in_index
    texture_rect.modulate = in_frog.color


#to get data that can be dragged and dropped onto controls that expect drop data
func _get_drag_data(_at_position: Vector2) -> Variant:
    set_drag_preview(get_preview())
    return texture_rect
    
    
#to test if data from a control's _get_drag_data() can be dropped at at_position
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data is TextureRect
    

# to pass you the data from a control's _get_drag_data() result
func _drop_data(_at_position: Vector2, data: Variant) -> void:
    var temp: Texture = texture_rect.texture
    texture_rect.texture = data.texture
    data.texture = temp
    

func get_preview():
    var preview_texture: TextureRect = TextureRect.new()
    preview_texture.texture = texture_rect.texture
    preview_texture.modulate = texture_rect.modulate
    preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
    preview_texture.size = Vector2.ONE * 25
    
    var preview: Control = Control.new()
    preview.add_child(preview_texture)
    return preview
    
    
func remove_texture():
    texture_rect.texture = null
