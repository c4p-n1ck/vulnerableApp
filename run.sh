#!/bin/bash

pause () {
  echo -n "Press any key to continue..."
  STAT_GETCH="0" 
  stty raw
  TMP_GETCH=`dd bs=1 count=1 2> /dev/null` 
  STAT_GETCH="${?}" 
  stty -raw
  if [[ "_${1}" != "_quiet" ]]
  then
          printf "\b \n"
  fi
  # return ${STAT_GETCH}
}

setitle () {
  printf "\e]2;$1\a"
}

install_dependencies() {
  echo "Installing Backend-Boilerplate's dependencies."
  pnpm install sqlite3 --save
  pnpm install express --save
  pnpm install express-handlebars --save
  pnpm install body-parser --save
  pnpm install cookie-parser --save
  pnpm install multer --save
}

if [[ $1 == "install" ]]; then
  setitle "Installer"
  echo "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  clear
  echo "Installing NodeJS latest LTS, and latest pnpm."
  nvm install --lts
  nvm use --lts
  npm install -g npm
  npm install -g pnpm
  clear
  install_dependencies
fi

cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; );
setitle "Backend"
while :; do node index.js $@; done
