Param(
  [Parameter(Mandatory=$true)][string]$hosts
)

$hosts = $hosts.replace("https://", "").replace("http://", "")
$hosts = [regex]::split($hosts, ", *")

$hosts | foreach {
  $host_port = [regex]::split($_, ":")
  $ipaddress=([System.Net.DNS]::GetHostAddresses($host_port[0]) | Where-Object {$_.AddressFamily -eq 'InterNetwork'} | Select-Object IPAddressToString)[0].IPAddressToString
  echo "$($ipaddress):$($host_port[1]) ($($host_port[0]))"
}
