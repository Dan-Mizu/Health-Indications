# full slot

#left
execute if score #healthindications.loop sourcecraft.temp matches 10 run data merge block ~ ~ ~ {Text1:'[{"nbt":"Text1","block":"~ ~ ~","interpret":"true"},{"nbt":"health_bar.icon.custom.full_left","storage":"healthindications","interpret":true}]'}

#middle
execute if score #healthindications.loop sourcecraft.temp matches 2..9 run data merge block ~ ~ ~ {Text1:'[{"nbt":"Text1","block":"~ ~ ~","interpret":"true"},{"nbt":"health_bar.icon.custom.full_middle","storage":"healthindications","interpret":true}]'}

#right
execute if score #healthindications.loop sourcecraft.temp matches 1 run data merge block ~ ~ ~ {Text1:'[{"nbt":"Text1","block":"~ ~ ~","interpret":"true"},{"nbt":"health_bar.icon.custom.full_right","storage":"healthindications","interpret":true}]'}