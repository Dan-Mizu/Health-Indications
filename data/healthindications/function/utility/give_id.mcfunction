# give ID to executor

#increment global ID to next ID
scoreboard players add #healthindications.ID healthindications.ID 1

#set executor to the new ID
scoreboard players operation @s healthindications.ID = #healthindications.ID healthindications.ID

#tag as ID initialized
tag @s add healthindications.init_ID