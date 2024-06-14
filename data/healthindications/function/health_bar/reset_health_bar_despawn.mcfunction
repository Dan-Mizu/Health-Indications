# reschedules despawn of health bar

#set despawn time
execute store result score @s healthindications.health_bar.despawn run time query gametime
scoreboard players add @s healthindications.health_bar.despawn 300

#schedule despawn
schedule function healthindications:health_bar/scheduled_end_health_bar 300t append