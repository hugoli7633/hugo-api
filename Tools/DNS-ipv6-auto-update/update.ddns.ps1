$hostname = "hugoli.click"
$username = "hugoli.click"
$password = ""
$ipv6Address = (Invoke-WebRequest -Uri "http://checkipv6.dyndns.com/" -UseBasicParsing).Content -replace '.*Current IP Address: ([^<]+).*','$1'

$url = "https://members.dyndns.org/nic/update?hostname=$hostname&myip=$ipv6Address"
$authInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username:$password"))

$headers = @{
    Authorization = "Basic $authInfo"
}


Invoke-RestMethod -Uri $url -Headers $headers