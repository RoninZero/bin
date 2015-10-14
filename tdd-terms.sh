#!/bin/sh

#gnome-terminal --window --working-directory="~/tdd-python/superlists" --title="editing" --geometry=+5+5\
#               --tab-with-profile="Default" --working-directory=/tdd-python/superlists --title="testing"\
#               --tab-with-profile="Default" --working-directory=/tdd-python/superlists --title="server" -e 'sh -c ~/bin/start-django-server.sh;	exec	bash'

gnome-terminal --window --working-directory=tdd-python/superlists --title="editing" --geometry=+5+5 \
               --tab --working-directory=tdd-python/superlists --title="testing" \
               --tab --working-directory=tdd-python/superlists --title="server" -e "sh -c ~/bin/start-django-server.sh"

#gnome-terminal --window --working-directory=tdd-python/superlists --title="Tab 1" --geometry=+5+5 --tab --working-directory=tdd-python/superlists/lists --title="Tab 2" --tab --working-directory=tdd-python --title="blech" -e "sh -c  ~/bin/start-django-server.sh"
