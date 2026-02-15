@echo off
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/kishan06/portfolio_app.git
git push -u origin main
PAUSE
