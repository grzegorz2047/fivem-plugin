version '1.0.0'
description 'ui dla minigry'
repository 'https://github.com/grzegorz2047/fivem-plugin'
author 'grzegorz2047 <grzegorz2047@gmail.com>'

fx_version 'bodacious'
game 'gta5'
ui_page 'html/index.html'

 
client_script 'client.lua'
server_script 'server.lua'
files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js'
}
--dependency 'cfx.re/playerData.v1alpha1'
lua54 'yes'
