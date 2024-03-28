# parse health indicator

#set symbol
execute if score #healthindications.health_difference healthindications.temp matches 1.. run data modify storage healthindications damage_indication.symbol set value '{"text":"+"}'
execute if score #healthindications.health_difference healthindications.temp matches ..0 run data modify storage healthindications damage_indication.symbol set value '{"text":""}'

#set color
execute if score #healthindications.health_difference healthindications.temp matches 1.. run data modify storage healthindications damage_indication.color set value '{"text":"","color":"green"}'
execute if score #healthindications.health_difference healthindications.temp matches ..0 run data modify storage healthindications damage_indication.color set value '{"text":"","color":"red"}'

#parse
data modify storage healthindications:damage_indicator temp append value '{"nbt":"damage_indication.color","storage":"healthindications","interpret":true}'
data modify storage healthindications:damage_indicator temp append value '{"nbt":"damage_indication.symbol","storage":"healthindications","interpret":true}'
data modify storage healthindications:damage_indicator temp append value '{"score":{"name":"#healthindications.health_difference","objective":"healthindications.temp"}}'
execute unless score #healthindications.option.damage_indication.no_icon healthindications.data matches 1 if score #healthindications.option.damage_indication.custom_texture healthindications.data matches 1 run data modify storage healthindications:damage_indicator temp append value '{"font":"healthindications:heart","translate":"icon.healthindications.damage_indication.heart","color":"white"}'
execute unless score #healthindications.option.damage_indication.no_icon healthindications.data matches 1 unless score #healthindications.option.damage_indication.custom_texture healthindications.data matches 1 unless score #healthindications.option.damage_indication.no_icon healthindications.data matches 1 run data modify storage healthindications:damage_indicator temp append value '{"nbt":"icon.damage_indication.heart","storage":"healthindications","interpret":true}'