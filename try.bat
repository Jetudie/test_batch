::declare variables
set input_files=input_fileA.txt input_fileB.txt input_fileC.txt
set output_files=file1 file2 file3 file4
set aermod_dir=%~dp0aermod_dir
set input_dir=%~dp0input_dir
set output_dir=%~dp0output_dir

for %%input_file in (%input_files%) do(
    ::copy input files to aermod directory
    cd %input_dir%
    copy %%input_file %aermod_dir%

    ::run aermod
    aermod.exe %%input_file

    ::create a folder in output directory
    set dir_name=result_of_%%input_file
    cd %output_dir%
    mkdir %dir_name%

    ::copy output files to the folder 
    cd %aermod_dir%
    copy %output_files% %output_dir%
    echo "%%input_file completed"
)