Install-WindowsFeature -Name Web-Server -IncludeManagementTools

$html = @"
<html>
  <body>
    <h1>Azure Infra Project</h1>
    <p>Web server deployed with Bicep and Custom Script Extension.</p>
  </body>
</html>
"@

Set-Content -Path 'C:\inetpub\wwwroot\iisstart.htm' -Value $html