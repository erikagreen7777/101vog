#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

#vogsphere@vogsphere.le-101.fr:intra/2018/activities/ft_ls/egreen

cat >> /etc/krb5.conf << EOF
[libdefaults]
    default_realm = le-101.fr
    forwardable = true
    proxiable = true
    dns_lookup_kdc = no
    dns_lookup_realm = no
    allow_weak_crypto = true
[realms]
    le-101.fr = {
        kdc = kdc.le-101.fr
        admin_server = kdc.le-101.fr
        default_domain = le-101.fr
        default_lifetime = 7d
        ticket_lifetime = 7d
    }
[domain_realm]
    .le-101.fr = le-101.fr 
    le-101.fr = le-101.fr 
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.le-101.fr
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"