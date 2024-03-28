# parse absorption indicator

#set symbol
execute if score #healthindications.absorption_difference healthindications.temp matches 1.. run data modify storage healthindications damage_indication.symbol set value '{"text":"+"}'
execute if score #healthindications.absorption_difference healthindications.temp matches ..0 run data modify storage healthindications damage_indication.symbol set value '{"text":""}'

#parse
data modify storage healthindications:damage_indicator temp append value '{"nbt":"damage_indication.symbol","storage":"healthindications","interpret":true,"color":"yellow"}'
data modify storage healthindications:damage_indicator temp append value '{"score":{"name":"#healthindications.absorption_difference","objective":"healthindications.temp"}}'
execute unless score #healthindications.option.damage_indication.no_icon healthindications.data matches 1 if score #healthindications.option.damage_indication.custom_texture healthindications.data matches 1 run data modify storage healthindications:damage_indicator temp append value '{"font":"healthindications:heart","translate":"icon.healthindications.damage_indication.absorption_heart","color":"white"}'
execute unless score #healthindications.option.damage_indication.no_icon healthindications.data matches 1 unless score #healthindications.option.damage_indication.custom_texture healthindications.data matches 1 run data modify storage healthindications:damage_indicator temp append value '{"nbt":"icon.damage_indication.absorption_heart","storage":"healthindications","interpret":true}'