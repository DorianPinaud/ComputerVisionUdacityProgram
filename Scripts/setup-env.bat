
echo off
:: Stepup the anaconda env
set path=%path%;%userprofile%\anaconda3\Scripts\
call conda env list | findstr /R "^cv-nd " > nul

:: If virtual env conda not exist create it
if errorlevel 1 (
    echo "Install environement"
    echo off
    conda create --name cv-nd python=3.6
    call activate cv-nd
    conda install pytorch-cpu -c pytorch

    :: Install python dependencies in the current virtual env
    pip install -r .\cd0360-Introduction-to-Computer-Vision\requirements.txt
    pip install opencv-python==3.4.17.63
    pip install torchvision==0.9.1
    
) else (
    echo "Environment activated"
    echo off
    call activate cv-nd
)
echo on