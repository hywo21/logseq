@echo off
@title bat execute git auto commit
D:
cd D:\logsqlDataBase\logseq
git add .
git commit -m "Auto commit."
git pull origin master
pause