import 'nodes.pp'
$puppetserver = 'puppet.example.com'
Exec {path => ["/usr/local/bin","/usr/local/sbin","/usr/local/bin","/usr/sbin","/usr/bin","/sbin","/bin"]}