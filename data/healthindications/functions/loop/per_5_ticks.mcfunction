# runs 4 times a second

#detect nearby entities with potion effects
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 if score #healthindications.option.health_bar.custom_texture healthindications.data matches 1 if score #healthindications.option.health_bar.status_effects healthindications.data matches 1 at @a as @e[tag=!global.ignore,tag=!healthindications.ignore,tag=!healthindications.no_status_effects,type=!minecraft:player,type=!#healthindications:no_health,distance=..30] run tag @s add healthindications.check_status_effects

#find entities to keep track of health
execute at @a as @e[tag=!global.ignore,tag=!healthindications.ignore,type=!minecraft:player,type=!#healthindications:no_health,distance=..30] run function healthindications:health/attempt_health_track

#remove tracking/health bars of entities that went too far away
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 as @e[tag=!global.ignore,tag=!healthindications.ignore,tag=!healthindications.no_health_bar,type=!#healthindications:healthbar_ignore,type=!minecraft:player,type=!#healthindications:no_health,tag=healthindications.within_range,tag=!healthindications.attempt_health_track] run function healthindications:health_bar/out_of_range

#give health bars to entities that have re-entered health bar range
execute if score #healthindications.option.health_bar.toggle healthindications.data matches 1 as @e[tag=!global.ignore,tag=!healthindications.ignore,tag=!healthindications.no_health_bar,type=!#healthindications:healthbar_ignore,type=!minecraft:player,type=!#healthindications:no_health,tag=healthindications.within_range,tag=!healthindications.active_health_bar,tag=!healthindications.attempt_health_track] if score @s healthindications.health_bar.despawn matches 0.. at @s run function healthindications:health_bar/init_health_bar

#track health
execute as @e[tag=!global.ignore,tag=!healthindications.ignore,type=!minecraft:player,type=!#healthindications:no_health,tag=healthindications.track_health] run function healthindications:health/track_mob_health
execute as @a[tag=!global.ignore,tag=!healthindications.ignore] run function healthindications:health/track_player_health

#remove temp tags
tag @e[tag=!global.ignore,tag=!healthindications.ignore,type=!minecraft:player,type=!#healthindications:no_health,tag=healthindications.attempt_health_track] remove healthindications.attempt_health_track
tag @e[tag=!global.ignore,tag=!healthindications.ignore,tag=!healthindications.no_status_effects,type=!minecraft:player,type=!#healthindications:no_health,tag=healthindications.check_status_effects] remove healthindications.check_status_effects

#loop
schedule function healthindications:loop/per_5_ticks 5t replace