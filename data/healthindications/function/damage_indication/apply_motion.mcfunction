# applies upward motion to damage indicators

# apply transform to damage indicators
execute as @e[type=minecraft:text_display,tag=healthindications.damage_indicator.apply_motion] run data merge entity @s {interpolation_duration:30,start_interpolation:-1,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.5f,0f],scale:[1f,1f,1f]}}

# remove tag
tag @e[type=minecraft:text_display,tag=healthindications.damage_indicator.apply_motion] remove healthindications.damage_indicator.apply_motion