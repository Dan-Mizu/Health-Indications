# runs every load/reload

#variables
scoreboard objectives add healthindications.data dummy
scoreboard objectives add healthindications.temp dummy
scoreboard objectives add healthindications.health dummy
scoreboard objectives add healthindications.health.previous dummy
scoreboard objectives add healthindications.health.percent dummy
scoreboard objectives add healthindications.absorption dummy
scoreboard objectives add healthindications.absorption.previous dummy
scoreboard objectives add healthindications.damage_indicator.gravity dummy
scoreboard objectives add healthindications.damage_indicator.duration dummy
scoreboard objectives add healthindications.health_bar.ID dummy
scoreboard objectives add healthindications.health_bar.despawn dummy
scoreboard objectives add healthindications.health_bar.update dummy

#player variables
scoreboard objectives add healthindications.ID dummy
scoreboard objectives add healthindications.respawn deathCount

#icons
data modify storage healthindications icon.health_bar.full set value '"■"'
data modify storage healthindications icon.health_bar.half set value '"◧"'
data modify storage healthindications icon.health_bar.empty set value '"□"'
data modify storage healthindications icon.health_bar.absorption set value '"❤"'
data modify storage healthindications icon.damage_indication.heart set value '"❤"'
data modify storage healthindications icon.damage_indication.absorption_heart set value '"❤"'

#constants
scoreboard players set #100 healthindications.data 100
scoreboard players set #3 healthindications.data 3
scoreboard players set #2 healthindications.data 2

#default options
execute unless score #healthindications.option.damage_indication.toggle healthindications.data matches 0.. run scoreboard players set #healthindications.option.damage_indication.toggle healthindications.data 1
execute unless score #healthindications.option.damage_indication.affect_players healthindications.data matches 0.. run scoreboard players set #healthindications.option.damage_indication.affect_players healthindications.data 1
execute unless score #healthindications.option.health_bar.toggle healthindications.data matches 0.. run scoreboard players set #healthindications.option.health_bar.toggle healthindications.data 1
execute unless score #healthindications.option.health_bar.affect_players healthindications.data matches 0.. run scoreboard players set #healthindications.option.health_bar.affect_players healthindications.data 1
execute unless score #healthindications.option.health_bar.better_sync healthindications.data matches 0.. run scoreboard players set #healthindications.option.health_bar.better_sync healthindications.data 1

#resourcepack options enabled
execute unless score #healthindications.option.damage_indication.custom_texture healthindications.data matches 0.. run scoreboard players set #healthindications.option.damage_indication.custom_texture healthindications.data 1
execute unless score #healthindications.option.health_bar.custom_texture healthindications.data matches 0.. run scoreboard players set #healthindications.option.health_bar.custom_texture healthindications.data 1
execute unless score #healthindications.option.health_bar.status_effects healthindications.data matches 0.. run scoreboard players set #healthindications.option.health_bar.status_effects healthindications.data 1

#start loops
function healthindications:loop/per_tick
function healthindications:loop/per_5_ticks
function healthindications:loop/per_20_ticks