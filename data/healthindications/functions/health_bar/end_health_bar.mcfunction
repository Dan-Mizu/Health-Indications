# end health bar

#get entity ID
scoreboard players operation #healthindications.entity_ID healthindications.temp = @s healthindications.ID

#find health bar
execute as @e[type=minecraft:text_display,tag=healthindications.health_bar] if score @s healthindications.health_bar.ID = #healthindications.entity_ID healthindications.temp run tag @s add healthindications.health_bar.execute

#kill health bar
kill @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=healthindications.health_bar.execute]

#reset tags
tag @e[type=minecraft:text_display,tag=healthindications.health_bar] remove healthindications.health_bar.execute
tag @s remove healthindications.active_health_bar