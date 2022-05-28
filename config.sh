#!/bin/bash



sed -i '/SPORT_CLUB_HOME/d' ~/.bashrc
sed -i '/alias /dc-sc' ~/.bashrc

export SPORT_CLUB_HOME=~/sport-club


echo "adicionando variavel ambiente " $SPORT_CLUB_HOME


if [ $SHELL = "/bin/bash" ]; then
    echo "export SPORT_CLUB_HOME="$SPORT_CLUB_HOME>>~/.bashrc
    echo "export SPORT_CLUB_HOME="$SPORT_CLUB_HOME>>~/.profile
    echo "alias dc-sc='docker-compose -f $SPORT_CLUB_HOME/manager-ms/docker-compose.yml -f $SPORT_CLUB_HOME/partners-ms/docker-compose.yml $SPORT_CLUB_HOME/notifications-ms/docker-compose.yml'">>~/.bashrc
    echo "alias dc-sc='docker-compose -f $SPORT_CLUB_HOME/manager-ms/docker-compose.yml -f $SPORT_CLUB_HOME/partners-ms/docker-compose.yml $SPORT_CLUB_HOME/notifications-ms/docker-compose.yml'">>~/.profile
    source ~/.bashrc
    source ~/.profile
else
    echo "export SPORT_CLUB_HOME="$SPORT_CLUB_HOME>>~/.zshrc
    echo "export SPORT_CLUB_HOME="$SPORT_CLUB_HOME>>~/.profile
    echo "alias dc-sc='docker-compose -f $SPORT_CLUB_HOME/manager-ms/docker-compose.yml -f $SPORT_CLUB_HOME/partners-ms/docker-compose.yml $SPORT_CLUB_HOME/notifications-ms/docker-compose.yml'">>~/.zshrc
    echo "alias dc-sc='docker-compose -f $SPORT_CLUB_HOME/manager-ms/docker-compose.yml -f $SPORT_CLUB_HOME/partners-ms/docker-compose.yml $SPORT_CLUB_HOME/notifications-ms/docker-compose.yml'">>~/.profile
    source ~/.zshrc
    source ~/.profile
fi

mkdir $SPORT_CLUB_HOME

cp ./clone-repo.sh $SPORT_CLUB_HOME

cd $SPORT_CLUB_HOME

./clone-repo.sh

sudo setfacl -R -d -m o::rwx $SPORT_CLUB_HOME
sudo setfacl -R -m o::rwx $SPORT_CLUB_HOME