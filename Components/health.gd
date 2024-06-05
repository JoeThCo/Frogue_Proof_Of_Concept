extends Node2D
class_name Health


signal health_under_zero


var hp: int


func health_init() -> void:
    hp = (randi() % 20) + 1
    health_under_zero.connect(on_health_under_zero)


func on_health_under_zero() -> void:
    BattleEventBus.board_update.emit()


func is_alive() -> bool:
    return hp > 0
    

func take_damage(damage: Damage) -> void:
    hp -= damage.amount
    if hp <= 0:
        health_under_zero.emit()


func _to_string() -> String:
    return "HP left:" + str(hp)
