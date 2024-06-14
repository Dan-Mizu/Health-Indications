# trigger health bar

#give ID if entity doesnt have one
execute unless score @s healthindications.ID matches 1.. run function healthindications:utility/give_id

#get entity ID
scoreboard players operation #healthindications.entity_ID healthindications.temp = @s healthindications.ID

#find health bar
execute as @e[type=minecraft:text_display,tag=healthindications.health_bar] if score @s healthindications.health_bar.ID = #healthindications.entity_ID healthindications.temp run tag @s add healthindications.health_bar.execute

#get current percent
scoreboard players operation #healthindications.current_percent healthindications.temp = @s healthindications.health.percent

#get current absorption
scoreboard players operation #healthindications.current_absorption healthindications.temp = @s healthindications.absorption

##module
#allow other packs to add their own text to the healthbar
function #healthindications:modules/add_health_bar_info

#init/reset health bar despawn timer
function healthindications:health_bar/reset_health_bar_despawn

# check if this entity should not have better sync enabled and tag the health bar
function healthindications:health_bar/check_sync_ignore

# enable or disable better sync
execute if score #healthindications.option.health_bar.better_sync healthindications.data matches 1 run ride @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=!healthindications.health_bar.better_sync.ignore,tag=healthindications.health_bar.execute,limit=1] mount @s
execute if score #healthindications.option.health_bar.better_sync healthindications.data matches 1 unless score #healthindications.option.health_bar.sync_ridables healthindications.data matches 1 run ride @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=healthindications.health_bar.better_sync.ignore,tag=healthindications.health_bar.execute,limit=1] dismount
execute unless score #healthindications.option.health_bar.better_sync healthindications.data matches 1 run ride @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=healthindications.health_bar.execute,limit=1] dismount

#update found health bar
execute as @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=healthindications.health_bar.execute] at @s run function healthindications:health_bar/update_health_bar

#init health bar if there is none
execute unless entity @e[type=minecraft:text_display,tag=healthindications.health_bar,tag=healthindications.health_bar.execute] at @s anchored eyes run function healthindications:health_bar/init_health_bar

#reset tags
tag @e[type=minecraft:text_display,tag=healthindications.health_bar] remove healthindications.health_bar.execute

# #reset storage
# data remove storage healthindications health_bar.extra_info