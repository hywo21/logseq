@echo off
@title bat execute git auto commit
D:
cd D:\logseqDate\logseq
git add .
git commit -m "Auto commit."
git push
pause