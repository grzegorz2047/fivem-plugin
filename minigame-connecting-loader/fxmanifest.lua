version '1.0.0'
description 'loader dla minigry'
repository 'https://github.com/grzegorz2047/fivem-plugin'
author 'grzegorz2047 <grzegorz2047@gmail.com>'

fx_version 'bodacious'
game 'gta5'

 files {
    'index.html',
    'css/style.css',
    'images/background.jpg',
    'css/bankgothic.ttf',
    'loadscreen.jpg',
	'music/Loading.mp3',
	'images/logo.png',
	
}

loadscreen 'index.html'

client_script 'client.lua'
server_script 'server.lua'

--dependency 'cfx.re/playerData.v1alpha1'
lua54 'yes'

