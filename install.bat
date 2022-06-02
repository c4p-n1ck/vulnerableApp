@echo off
title Installer
cls
:top
echo "Please first download and install: https://github.com/coreybutler/nvm-windows/releases/download/1.1.9/nvm-setup.exe"
echo.
echo "After installation is done;"
pause
cls
nvm --help >nil 2>nil
IF %ERRORLEVEL% EQU 0 goto top
cls
echo "Installing NodeJS latest LTS, and latest pnpm."
nvm install --lts
nvm use --lts
npm install -g npm
npm install -g pnpm
cls
echo "Installing Backend-Boilerplate's dependencies."
pnpm install sqlite3 --save
pnpm install express --save
pnpm install express-handlebars --save
pnpm install body-parser --save
pnpm install cookie-parser --save
pnpm install multer --save
