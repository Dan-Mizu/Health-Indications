# summon damage indicator

#create damage indication entity
execute anchored eyes positioned ^ ^ ^ run summon minecraft:text_display ~ ~ ~ {Tags:["healthindications.damage_indicator","healthindications.damage_indicator.execute","global.ignore"],shadow_radius:0f,shadow_strength:0f,text_opacity:255,default_background:0b,shadow:0b,see_through:0b,alignment:"center",text:'{"text":""}',billboard:"center",background:16777215}

# tag to apply transform next tick
execute unless score #healthindications.option.damage_indication.stationary healthindications.data matches 1 run tag @e[type=minecraft:text_display,tag=healthindications.damage_indicator.execute,limit=1] add healthindications.damage_indicator.apply_motion

# schedule motion
execute unless score #healthindications.option.damage_indication.stationary healthindications.data matches 1 run schedule function healthindications:damage_indication/apply_motion 1t replace

# DEBUG
# tellraw @a {"nbt":"temp[]","storage":"healthindications:damage_indicator"}

#set name of damage indication to parsed value
data modify entity @e[type=minecraft:text_display,tag=healthindications.damage_indicator.execute,limit=1] text set value '{"storage":"healthindications:damage_indicator","nbt":"temp[]","interpret":true,"separator":""}'

#remove temp tags
tag @e[type=minecraft:text_display,tag=healthindications.damage_indicator.execute,limit=1,sort=nearest] remove healthindications.damage_indicator.execute

# reset temp
data remove storage healthindications:damage_indicator temp