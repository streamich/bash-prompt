SOURCE_FILE="~/.bash_profile"
TEMPLATE_FILE="~/streamich-bash-template.sh"

wget -O ~/streamich-bash-template.sh https://raw.githubusercontent.com/streamich/bash-prompt/master/template.sh
echo -e "\nsource ~/streamich-bash-template.sh" >> ~/.bash_profile
