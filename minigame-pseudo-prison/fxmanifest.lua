version '1.0.0'
description 'pseudo-wiezienie dla minigry'
repository 'https://github.com/grzegorz2047/fivem-plugin'
author 'grzegorz2047 <grzegorz2047@gmail.com>'

fx_version 'bodacious'
game 'gta5'

 client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client.lua'
}
server_script 'server.lua'

--dependency 'cfx.re/playerData.v1alpha1'
lua54 'yes'
