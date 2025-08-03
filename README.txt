1. Setup Azure Devops Feed.
2. Create the NugetPublish script. (which we already created and saved inside the ApiClients solution).

 Nuget Package code change update will increment the version.
3. Package the solution.
	1. increase the version from .csproj of ApiClients.
	2. dotnet pack -c Release
	3. execute .\NugetPublish.ps1 
4. Add package to Service (Account Service project(s))
	1. dotnet add package BTM.ApiClients --version 1.0.1 (updated version).