# toggle health bar

#cancel command feedback
function #healthindications:cancel_command_feedback

#determine 
execute unless score #healthindications.option.health_bar.toggle healthindications.data matches 1 run scoreboard players set #option healthindications.temp 1
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 run scoreboard players set #option healthindications.temp 0

#set
scoreboard players operation #healthindications.option.health_bar.toggle healthindications.data = #option healthindications.temp

#sound
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 0 run playsound minecraft:block.fire.extinguish master @s ~ ~ ~ 1 1.5

#kill all healthbars
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 0 as @e[type=!#healthindications:no_health,tag=healthindications.active_health_bar] run scoreboard players reset @s healthindications.health_bar.despawn
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 0 as @e[type=!#healthindications:no_health,tag=healthindications.active_health_bar] at @s run function healthindications:health_bar/end_health_bar

#run options menu
function healthindications:internal/options