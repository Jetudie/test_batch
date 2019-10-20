echo %~dp0
cd %~dp0output_dir
set name=123
md %name%
set dd = %~dp0output_dir %name%
echo %dd%
cd %dd%
cd %~dp0