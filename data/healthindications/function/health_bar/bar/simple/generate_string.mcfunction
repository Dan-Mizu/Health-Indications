# generate string

#full bar
execute if score #healthindications.current_percent healthindications.temp > #healthindications.half_of_interval healthindications.temp run data modify storage healthindications:health_bar temp append value '{"nbt":"icon.health_bar.full","storage":"healthindications","interpret":true}'

#half empty bar
execute unless score #healthindications.current_percent healthindications.temp > #healthindications.half_of_interval healthindications.temp if score #healthindications.current_percent healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"nbt":"icon.health_bar.half","storage":"healthindications","interpret":true}'

#empty bar
execute unless score #healthindications.current_percent healthindications.temp > #healthindications.half_of_interval healthindications.temp unless score #healthindications.current_percent healthindications.temp matches 1.. run data modify storage healthindications:health_bar temp append value '{"nbt":"icon.health_bar.empty","storage":"healthindications","interpret":true}'

#update position through the bar
scoreboard players operation #healthindications.current_percent healthindications.temp -= #healthindications.interval healthindications.temp

#next loop
scoreboard players remove #healthindications.loop healthindications.temp 1

#loop
execute if score #healthindications.loop healthindications.temp matches 1.. run function healthindications:health_bar/bar/simple/generate_string