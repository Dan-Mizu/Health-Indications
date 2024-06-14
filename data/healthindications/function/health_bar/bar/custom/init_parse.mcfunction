# init health bar parsing

#set interval
scoreboard players set #healthindications.interval healthindications.temp 10
scoreboard players operation #healthindications.half_of_interval healthindications.temp = #healthindications.interval healthindications.temp
scoreboard players operation #healthindications.half_of_interval healthindications.temp /= #2 healthindications.data

#set loop
scoreboard players set #healthindications.loop healthindications.temp 10

#generate
function healthindications:health_bar/bar/custom/generate_string

#add absorption hearts
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"text":" ","font":"minecraft:default"}'
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"score":{"name":"#healthindications.current_absorption","objective":"healthindications.temp"},"font":"minecraft:default"}'
execute if score #healthindications.current_absorption healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"font":"healthindications:health_bar","translate":"icon.healthindications.health_bar.absorption_heart","color":"white"}'

##modules
#add extra info set by other packs
execute if data storage healthindications health_bar.extra_info run data modify storage healthindications:health_bar temp append value '{"text":" ","font":"minecraft:default"}'
execute if data storage healthindications health_bar.extra_info run data modify storage healthindications:health_bar temp append value '{"storage":"healthindications","nbt":"health_bar.extra_info[]","interpret":true,"separator":""}'