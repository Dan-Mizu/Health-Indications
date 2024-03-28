# handle duration of armor stand damage indicators

#if duration is over, delete
execute if score @s healthindications.damage_indicator.duration matches 30.. run kill @s

#add to duration
scoreboard players add @s healthindications.damage_indicator.duration 1