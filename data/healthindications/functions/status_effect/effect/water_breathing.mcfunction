# add water breathing to health bar

#add icon to extra info
data modify storage healthindications health_bar.extra_info append value '{"font":"healthindications:status_effect","translate":"icon.healthindications.status_effect.water_breathing","color":"white"}'

#tag health bar to update
scoreboard players set @s healthindications.health_bar.update 1