# empty slot

#left
execute if score #healthindications.loop healthindications.temp matches 10 run data modify storage healthindications:health_bar temp append value '{"font":"healthindications:health_bar","translate":"icon.healthindications.health_bar.empty_left"}'

#middle
execute if score #healthindications.loop healthindications.temp matches 2..9 run data modify storage healthindications:health_bar temp append value '{"font":"healthindications:health_bar","translate":"icon.healthindications.health_bar.empty_middle"}'

#right
execute if score #healthindications.loop healthindications.temp matches 1 run data modify storage healthindications:health_bar temp append value '{"font":"healthindications:health_bar","translate":"icon.healthindications.health_bar.empty_right"}'