#!/usr/bin/env bash
cd $HOME/TEAMTELETHON
rm -rf $HOME/.telegram-cli
install() {
rm -rf $HOME/.telegram-cli
sudo chmod +x tg
chmod +x TEAMTELETHON
chmod +x ts
./ts
}
if [ "$1" = "ins" ]; then
install
fi
chmod +x telethoninstall.sh
lua startTelethon.lua
