echo on

set PATH="%PYTHON%";"%PYTHON%\Scripts";%PATH%

python -m pip install -U setuptools pip wheel
if %ERRORLEVEL% NEQ 0 exit 1

python -m pip install -e .
if %ERRORLEVEL% NEQ 0 exit 1

python -m pip install pytest mock
if %ERRORLEVEL% NEQ 0 exit 1

py.test tests --cov-report term-missing --cov pypac
if %ERRORLEVEL% NEQ 0 exit 1

python setup.py bdist_wheel
if %ERRORLEVEL% NEQ 0 exit 1
