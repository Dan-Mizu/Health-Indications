# runs on entities that need to get their health percent updated

#update health percent
execute as @e[type=!#healthindications:no_health,tag=healthindications.update_health_percent,tag=!healthindications.ignore] run function healthindications:health/get_health_percent

#remove tag
tag @e[type=!#healthindications:no_health,tag=healthindications.update_health_percent,tag=!healthindications.ignore] remove healthindications.update_health_percent