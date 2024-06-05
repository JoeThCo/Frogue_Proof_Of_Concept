extends PanelContainer
class_name Being_Slot


@export var being_stats: Being_Stats


var is_filled: bool = false
var can_player_modify: bool = false


func being_slot_init(in_can_player_modify: bool):
    can_player_modify = in_can_player_modify


#to get data that can be dragged and dropped onto controls that expect drop data
func _get_drag_data(_at_position: Vector2) -> Variant:
    if !can_player_modify: return
    
    set_drag_preview(get_preview())
    return being_stats
    
    
#to test if data from a control's _get_drag_data() can be dropped at at_position
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data is TextureRect
    

# to pass you the data from a control's _get_drag_data() result
func _drop_data(_at_position: Vector2, data: Variant) -> void:
    var temp = being_stats.property
    being_stats.property = data.property
    data.property = temp
    BattleEventBus.board_update.emit()
    

func get_preview() -> Control:
    print(being_stats)
    var preview_texture: TextureRect = TextureRect.new()
    preview_texture.texture = being_stats.texture
    preview_texture.modulate = being_stats.being_type.get_color() #throws error on dragging empty slot
    preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
    preview_texture.size = Vector2.ONE * 25
    
    var preview: Control = Control.new()
    preview.add_child(preview_texture)
    return preview
    
    
func set_property(frog_data: Dictionary) -> void:
    being_stats.property = frog_data
    is_filled = being_stats.property["Texture"] != null
