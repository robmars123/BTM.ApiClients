# Step 1: Define your variables
$organization = "robmars2008"
$feedName = "ECommerceFeed"
$project = "BTM.ApiClients"  # Optional if feed is at org level
$pat = ""        # Replace with your actual PAT
$packagePath = "D:\Projects\BTM\Github - BTM Application\src\BTM.ApiClients\bin\Release\ECommerce.ApiClients.1.0.0.nupkg"  # Replace with your .nupkg file path

# Step 2: Encode the PAT for Basic Auth
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))

# Step 3: Set headers for REST API calls
$headers = @{
    Authorization = "Basic $base64AuthInfo"
    Accept = "application/json"
}

# Step 4: (Optional) Test authentication by listing feeds
Invoke-RestMethod -Uri "https://feeds.dev.azure.com/$organization/_apis/packaging/feeds?api-version=6.0-preview.1" -Headers $headers

# Step 5: Push the NuGet package using nuget.exe
.\nuget.exe push $packagePath `
  -Source "https://pkgs.dev.azure.com/robmars2008/1ace2171-b710-456d-8917-2cdf45f4e3c4/_packaging/ECommerceFeed/nuget/v3/index.json" `
  -ApiKey $pat
