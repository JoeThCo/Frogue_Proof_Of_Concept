extends PanelContainer
class_name BeingSlot


@export var being_stats: BeingStats
var grid_coords: Vector2i


var is_filled: bool = false
var can_player_modify: bool = false


func being_slot_init(in_coords: Vector2i, in_can_player_modify: bool):
    grid_coords = in_coords
    can_player_modify = in_can_player_modify
    
    
func compare_slots(b: BeingSlot) -> bool:
    return get_instance_id() == b.get_instance_id()


#to get data that can be dragged and dropped onto controls that expect drop data
func _get_drag_data(_at_position: Vector2) -> Variant:
    if !can_player_modify or !being_stats.is_being_slot() or BattleEventBus.is_battling: return
    
    var preview: Control = get_preview()
    if preview != null:
        set_drag_preview(preview)
    else:
        return null
        
    return being_stats
    
    
#to test if data from a control's _get_drag_data() can be dropped at at_position
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
    return data is TextureRect and can_player_modify == data.being_slot.can_player_modify
    

# to pass you the data from a control's _get_drag_data() result
func _drop_data(_at_position: Vector2, data: Variant) -> void:
    var temp = being_stats.property
    being_stats.property = data.property
    data.property = temp
    BattleEventBus.board_update.emit()
    BattleEventBus.mouse_enter_being_slot.emit(self)
    
    
func get_preview() -> Control:
    #print(being_stats)
    if !being_stats.is_being_slot(): return null
    
    var preview_texture: TextureRect = TextureRect.new()
    preview_texture.texture = being_stats.texture
    preview_texture.modulate = being_stats.type.get_color()
    preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
    preview_texture.size = Vector2.ONE * 25
    
    var preview: Control = Control.new()
    preview.add_child(preview_texture)
    return preview
    
    
func set_property(being_data: Dictionary) -> void:
    being_stats.property = being_data
    is_filled = being_stats.property["Texture"] != null


func _on_mouse_entered() -> void:
    BattleEventBus.mouse_enter_being_slot.emit(self)


func _on_mouse_exited() -> void:
    BattleEventBus.mouse_exit_being_slot.emit(self)
