@echo off
echo === Fixing Git Setup ===
echo.

echo 1. Removing incorrect files...
del .gitignore.txt 2>nul

echo.
echo 2. Creating proper .gitignore...
(
echo node_modules/
echo .next/
echo out/
echo .env.local
echo .env
echo .vercel
echo .DS_Store
echo "components/* - Copy*"
echo "components/* - Backup*"
) > .gitignore

echo.
echo 3. Cleaning git cache...
git rm -r --cached .next 2>nul
git rm --cached "components/* - Copy*" 2>nul
git rm --cached "components/* - Backup*" 2>nul

echo.
echo 4. Adding files...
git add .

echo.
echo 5. Committing...
git commit -m "Movie AI Explorer: Ready for deployment"

echo.
echo === DONE ===
echo.
echo To verify: dir .gitignore*
echo Should show: .gitignore
echo.
pause