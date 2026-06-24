@echo on

:: CPython 3.9+ Windows x86-64
%PYTHON% -m pip install --no-deps --no-build-isolation https://pypi.org/packages/cp39/r/runtimed/runtimed-%PKG_VERSION%-cp39-cp39-win_amd64.whl

if errorlevel 1 exit 1