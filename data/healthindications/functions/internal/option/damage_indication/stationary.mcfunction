# make damage indicators stationary instead of moving up

#cancel command feedback
function #healthindications:cancel_command_feedback

#determine 
execute unless score #healthindications.option.damage_indication.stationary healthindications.data matches 1 run scoreboard players set #option healthindications.temp 1
execute if score #healthindications.option.damage_indication.stationary healthindications.data matches 1 run scoreboard players set #option healthindications.temp 0

#set
scoreboard players operation #healthindications.option.damage_indication.stationary healthindications.data = #option healthindications.temp

#sound
execute if score #healthindications.option.damage_indication.stationary healthindications.data matches 1 run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5
execute if score #healthindications.option.damage_indication.stationary healthindications.data matches 0 run playsound minecraft:block.fire.extinguish master @s ~ ~ ~ 1 1.5

#run options menu
function healthindications:internal/options