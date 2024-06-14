# runs 20 times a second

#handle damage indicators
execute as @e[type=minecraft:text_display,tag=healthindications.damage_indicator] at @s run function healthindications:damage_indication/handle_damage_indicators

#handle health bars
execute as @e[type=minecraft:text_display,tag=healthindications.health_bar] at @s run function healthindications:health_bar/handle_health_bar

#detect respawn
execute as @e[type=minecraft:player] if score @s healthindications.respawn matches 1.. run function healthindications:on_event/on_respawn

#loop
schedule function healthindications:loop/per_tick 1t replace