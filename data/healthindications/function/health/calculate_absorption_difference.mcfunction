# calculates the absorption difference between their previous and new health

#get current absorption
scoreboard players operation #healthindications.current_absorption healthindications.temp = @s healthindications.absorption

#subtract previous absorption from current absorption
execute store result score #healthindications.absorption_difference healthindications.temp run scoreboard players operation #healthindications.current_absorption healthindications.temp -= @s healthindications.absorption.previous