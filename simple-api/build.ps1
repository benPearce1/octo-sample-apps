

mkdir tools -Force
mkdir publish -Force
mkdir artifacts -Force
Push-Location tools
Invoke-WebRequest -uri https://download.octopusdeploy.com/octopus-tools/4.37.0/OctopusTools.4.37.0.zip -OutFile octo.zip
Expand-Archive octo.zip -DestinationPath . -Force
Remove-Item octo.zip
Pop-Location

dotnet build 
dotnet publish --output .\publish
.\tools\octo.exe pack --basepath=.\publish --outfolder=.\artifacts --version=1.0.0 --format=zip --id=simple-api --overwrite

