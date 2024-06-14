# update health bar

#init parse
execute if score #healthindications.option.health_bar.custom_texture healthindications.data matches 1 run function healthindications:health_bar/bar/custom/init_parse
execute unless score #healthindications.option.health_bar.custom_texture healthindications.data matches 1 run function healthindications:health_bar/bar/simple/init_parse

# DEBUG
# tellraw @a {"nbt":"temp[]","storage":"healthindications:health_bar"}

#set name to parsed string
data modify entity @s text set value '{"storage":"healthindications:health_bar","nbt":"temp[]","interpret":true,"separator":""}'

# reset temp
data remove storage healthindications:health_bar temp