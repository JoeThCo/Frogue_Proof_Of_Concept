extends Control
class_name AbilityInfoUI


func ability_info_init(ability: Ability) -> void:
    $Ability.text = str(ability.battle_event) + ": " + str(BattleResources.WhenToTrigger.keys()[ability.when_to_trigger])
    $When.text = "IF " + str(ability.trigger)
