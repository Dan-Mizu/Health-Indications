# runs a damage indicator when executor's health changes

#parse health change
execute unless score #healthindications.health_difference healthindications.temp matches 0 run function healthindications:damage_indication/init_health_indication

#parse absorption change
execute if score #healthindications.health_difference healthindications.temp matches 0 positioned ~ ~ ~ unless score #healthindications.absorption_difference healthindications.temp matches 0 run function healthindications:damage_indication/init_absorption_indication
execute unless score #healthindications.health_difference healthindications.temp matches 0 positioned ~ ~0.26 ~ unless score #healthindications.absorption_difference healthindications.temp matches 0 run function healthindications:damage_indication/init_absorption_indication