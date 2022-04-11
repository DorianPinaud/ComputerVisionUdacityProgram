
@echo off
:: Stepup the anaconda env
set path=%path%;%userprofile%\anaconda3\Scripts\
conda env list | findstr /R "^cv-nd " > nul

:: If virtual env conda not exist create it
if errorlevel 1 (
    echo "Install environement"
    echo off
    call activate
    conda install python=3.6
    conda install pytorch-cpu -c pytorch
    conda create --name cv-nd python=3.6
    echo "Environment activated"
    call activate cv-nd
    
    :: Install python dependencies in the current virtual env
    pip install -r .\Scripts\requirements.txt
    
) else (
    echo "Environment activated"
    @echo off
    call activate cv-nd
)
echo on