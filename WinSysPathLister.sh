# Created by Tom R. Day of the eclipse  

# Put a Windows path list in to a txt file make it a list or paste in directly

sed 's/;/\n/g' paths.txt

# You can also paste the string directly, via echo and skip creating the file

echo "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files (x86)\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Users\emma\AppData\Local\Microsoft\WindowsApps;" | sed 's/;/\n/g'

echo "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\...." | sed 's/;/\n/g'
