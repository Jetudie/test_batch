::declare variables
::set input_files=input_fileA.txt input_fileB.txt input_fileC.txt
set output_files=file1 file2 file3 file4
set aermod_dir1=%~dp0aermod_dir
set input_dir1=%~dp0input_dir
set output_dir1=%~dp0output_dir
timeout 2
SETLOCAL ENABLEDELAYEDEXPANSION
for /r %input_dir1% %%f in (*.txt) do ( 
    ::copy input files to aermod directory
    cd %input_dir1%
    copy %%f %aermod_dir1%
    ::run aermod
    cd %aermod_dir1%
    cmd /c aermod.exe %%~nf
    ::create a folder in output directory
    cd %output_dir1%
    mkdir result_of_%%~nf
    ::copy output files to the folder 
    cd %aermod_dir1%
    for %%I in (%output_files%) do copy %%I %output_dir1%\result_of_%%~nf
    echo %%f completed
)
ENDLOCAL