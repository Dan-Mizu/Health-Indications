# end health bar executed as health bars

#get health bar ID
#scoreboard players operation #healthindications.health_bar_ID sourcecraft.temp = @s healthindications.health_bar.ID

#find matching player (if they were in creative/spectator)
execute as @a if score @s sourcecraft.ID = #healthindications.health_bar_ID sourcecraft.temp run tag @s add healthindications.found_entity

#kill health bar
kill @s

#reset despawn
scoreboard players reset @p[tag=healthindications.found_entity] healthindications.health_bar.despawn

#reset tags
tag @p[tag=healthindications.found_entity] remove healthindications.active_health_bar
tag @p[tag=healthindications.found_entity] remove healthindications.found_entity
