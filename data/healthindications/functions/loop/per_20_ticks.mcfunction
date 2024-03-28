# runs once every second

#init health percent of all health-bearing entities
execute as @e[type=!#healthindications:no_health,tag=healthindications.within_range,tag=!healthindications.init_health_percent,tag=!healthindications.ignore] run function healthindications:health/get_health_percent
execute as @a[tag=!healthindications.init_health_percent,tag=!healthindications.ignore] run function healthindications:health/get_health_percent

#give ID to players
execute as @a[tag=!healthindications.init_ID] run function healthindications:utility/give_id

#loop
schedule function healthindications:loop/per_20_ticks 20t replace