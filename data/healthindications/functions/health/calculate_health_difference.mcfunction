# calculates the health difference between their previous and new health

#get current health
scoreboard players operation #healthindications.current_health healthindications.temp = @s healthindications.health

#subtract previous health from current health
execute store result score #healthindications.health_difference healthindications.temp run scoreboard players operation #healthindications.current_health healthindications.temp -= @s healthindications.health.previous