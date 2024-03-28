# track health of executing entity (non-player)

#get current health
execute store result score @s healthindications.health run data get entity @s Health

#check if health changed
execute if entity @s[tag=healthindications.within_range] if score @s healthindications.health.previous matches 1.. unless score @s healthindications.health = @s healthindications.health.previous run scoreboard players set @s healthindications.health_bar.update 1

#get current absorption
execute store result score @s healthindications.absorption run data get entity @s AbsorptionAmount

#check absorption difference
execute if entity @s[tag=healthindications.within_range] if score @s healthindications.absorption.previous matches 0.. unless score @s healthindications.absorption = @s healthindications.absorption.previous run scoreboard players set @s healthindications.health_bar.update 1

#check for status effects
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 if score #healthindications.option.health_bar.custom_texture healthindications.data matches 1 if score #healthindications.option.health_bar.status_effects healthindications.data matches 1 if entity @s[tag=!global.ignore,tag=!healthindications.ignore,tag=!healthindications.no_status_effects,tag=healthindications.check_status_effects] run function healthindications:status_effect/check_status_effect

# prevent healthbars from showing on mobs with invisibility
execute if predicate healthindications:status_effect/invisibility run scoreboard players reset @s healthindications.health_bar.update
execute if predicate healthindications:status_effect/invisibility run function healthindications:health_bar/end_health_bar

#update health related indications
execute if score @s healthindications.health_bar.update matches 1 run function healthindications:health/mob_health_update

#store current health and absorption
scoreboard players operation @s healthindications.health.previous = @s healthindications.health
execute unless score @s healthindications.absorption.previous matches 0.. run scoreboard players set @s healthindications.absorption 0
scoreboard players operation @s healthindications.absorption.previous = @s healthindications.absorption

#reset temp scores
scoreboard players reset @s healthindications.health_bar.update

#reset storage
data remove storage healthindications health_bar.extra_info