# runs if this core datapack is the newest version

#run if load status matches this core datapacks version
tag @s add healthindications.update_health_percent
schedule function healthindications:health/scheduled_update_health_percent 1t