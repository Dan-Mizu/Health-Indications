# init health bar parsing

#set interval
scoreboard players set #healthindications.interval healthindications.temp 10
scoreboard players operation #healthindications.half_of_interval healthindications.temp = #healthindications.interval healthindications.temp
scoreboard players operation #healthindications.half_of_interval healthindications.temp /= #2 healthindications.data

#set loop
scoreboard players set #healthindications.loop healthindications.temp 10

#init color
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"text":"","color":"yellow"}'
execute unless score #healthindications.current_absorption healthindications.temp matches 1.. if score #healthindications.current_percent healthindications.temp matches 76.. run data modify storage healthindications:health_bar temp append value '{"text":"","color":"green"}'
execute unless score #healthindications.current_absorption healthindications.temp matches 1.. if score #healthindications.current_percent healthindications.temp matches 26..75 run data modify storage healthindications:health_bar temp append value '{"text":"","color":"yellow"}'
execute unless score #healthindications.current_absorption healthindications.temp matches 1.. if score #healthindications.current_percent healthindications.temp matches ..25 run data modify storage healthindications:health_bar temp append value '{"text":"","color":"red"}'

#generate
function healthindications:health_bar/bar/simple/generate_string

#add absorption hearts
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"text":" ","font":"minecraft:default"}' 
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"score":{"name":"#healthindications.current_absorption","objective":"healthindications.temp"}}'
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"nbt":"icon.health_bar.absorption","storage":"healthindications","interpret":true}'

##modules
#add extra info set by other packs
execute if data storage healthindications health_bar.extra_info run data modify storage healthindications:health_bar temp append value '{"text":" ","font":"minecraft:default"}'
execute if data storage healthindications health_bar.extra_info run data modify storage healthindications:health_bar temp append value '{"nbt":"health_bar.extra_info[]","storage":"healthindications","interpret":true}'