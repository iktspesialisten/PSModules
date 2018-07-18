# PSModules
Powershell modules
This repository is a temp folder for my powershell modules that are beeing posted on the powershell gallery.
It need some versioning schematics before it is done.


Here is the procedure to install modules.
You can do a simple import-module infomodule.ps1 but this will only last the session you are in.
For a permanent solution make a directory called Modules under user/documents/WindowsPowerShell called modules.
Then under this directory make a folder in this case called infomodule and copy the infomodule.ps1 file in here.
Then the module will load every time you open a new PowerShell session.
