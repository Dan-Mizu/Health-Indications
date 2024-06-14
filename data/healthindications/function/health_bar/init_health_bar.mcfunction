# initialize new health bar

#get entity ID
scoreboard players operation #healthindications.entity_ID healthindications.temp = @s healthindications.ID

#spawn new health bar
execute anchored eyes run summon minecraft:text_display ~ ~ ~ {Tags:["healthindications.health_bar","healthindications.health_bar.execute","global.ignore"],shadow_radius:0f,shadow_strength:0f,text_opacity:255,default_background:0b,shadow:0b,see_through:0b,alignment:"center",text:'{"text":""}',billboard:"center",background:16777215,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}

#sync ID
scoreboard players operation @e[type=minecraft:text_display,tag=healthindications.health_bar.execute,limit=1] healthindications.health_bar.ID = #healthindications.entity_ID healthindications.temp

# check if better sync is ignored on this entity
function healthindications:health_bar/check_sync_ignore

# make healthbar ride the entity
execute if score #healthindications.option.health_bar.better_sync healthindications.data matches 1 if entity @e[type=minecraft:text_display,tag=healthindications.health_bar.execute,tag=!healthindications.health_bar.better_sync.ignore] store success score #healthindications.health_bar.ridable healthindications.temp run ride @e[type=minecraft:text_display,tag=healthindications.health_bar.execute,tag=!healthindications.health_bar.better_sync.ignore,limit=1] mount @s

# ignore better sync if unable to ride
execute if score #healthindications.option.health_bar.better_sync healthindications.data matches 1 if entity @e[type=minecraft:text_display,tag=healthindications.health_bar.execute,tag=!healthindications.health_bar.better_sync.ignore] if score #healthindications.health_bar.ridable healthindications.temp matches 0 run tag @e[type=minecraft:text_display,tag=healthindications.health_bar.execute,limit=1] add healthindications.health_bar.better_sync.ignore

#get current percent
scoreboard players operation #healthindications.current_percent healthindications.temp = @s healthindications.health.percent

#tag as having an active health bar
tag @s add healthindications.active_health_bar

#update health bar
execute as @e[type=minecraft:text_display,tag=healthindications.health_bar.execute] at @s run function healthindications:health_bar/update_health_bar

#reset tags
tag @e[type=minecraft:text_display,tag=healthindications.health_bar.execute] remove healthindications.health_bar.execute

# reset temp scores
scoreboard players reset #healthindications.health_bar.ridable healthindications.temp