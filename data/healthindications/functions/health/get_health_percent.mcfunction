# calculate percent of health compared to max of executor

#get max health
execute store result score #healthindications.current_max_health healthindications.temp run attribute @s minecraft:generic.max_health get

#get current health
scoreboard players operation #healthindications.current_health healthindications.temp = @s healthindications.health

#get percentage
scoreboard players operation #healthindications.current_health healthindications.temp *= #100 healthindications.data
execute store result score @s healthindications.health.percent run scoreboard players operation #healthindications.current_health healthindications.temp /= #healthindications.current_max_health healthindications.temp

#tag init
tag @s[tag=!healthindications.init_health_percent] add healthindications.init_health_percent