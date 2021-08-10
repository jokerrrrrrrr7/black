#!/usr/bin/env bash
cd $HOME/TEAMBLACK
rm -rf $HOME/.telegram-cli
install() {
rm -rf $HOME/.telegram-cli
sudo chmod +x tg
chmod +x TEAMBLACK
chmod +x ts
./ts
}
if [ "$1" = "ins" ]; then
install
fi
chmod +x telethoninstall.sh
lua startTelethon.lua
