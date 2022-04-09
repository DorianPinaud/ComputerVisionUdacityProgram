echo off
:: Stepup the anaconda env
set path=%path%;%userprofile%\anaconda3\Scripts\
conda deactivate
conda remove --name cv-nd --all