If you are searching for a Hashcat ID, you can use the following to list all.

`hashcat -h | grep '^[[:space:]]*[0-9]'`

More often, grep for the hash type.

| Hash Indicator       | Hash Type                                | Hashcat ID |
|----------------------|------------------------------------------|------------|
| `$1$`                | MD5(Unix)                                | 500        |
| `$2$`                | bcrypt                                   | 3200       |
| `$2a$`               | bcrypt (Blowfish)                        | 3200       |
| `$2b$`               | bcrypt (Blowfish)                        | 3200       |
| `$2b$`               | bcrypt $2b$                              | 3200       |
| `$2b$`               | bcrypt (Blowfish)                        | 3200       |
| `$2x$`               | bcrypt                                   | 3200       |
| `$2x$`               | bcrypt                                   | 3200       |
| `$2y$`               | bcrypt                                   | 3200       |
| `$2y$`               | bcrypt                                   | 3200       |
| `$23$`               | KERBEROAST HASHES                        | 13100      |
| `$3$`                | LM (LAN Manager)                         | 3000       |
| `$3$`                | LM (LAN Manager)                         | 3000       |
| `$5$`                | SHA-256(Unix)                            | 7400       |
| `$6$`                | SHA-512(Unix)                            | 1800       |
| `$7$`                | scrypt                                   | 8900       |
| `$apr1$`             | Apache MD5                               | 1600       |
| `$H$`                | MD5(phpBB3)                              | 400        |
| `$H$`                | MD5(Joomla)                              | 400        |
| `$P$`                | MD5(phpBB3)                              | 400        |
| `$S$`                | SHA-512(Drupal)                          | 7900       |
| `$argon2d$`          | Argon2d                                  | 13000      |
| `$argon2i$`          | Argon2                                   | 10000      |
| `$argon2id$`         | Argon2id                                 | 23000      |
| `$pbkdf2$`           | PBKDF2-HMAC-SHA1(Django)                 | 10000      |
| `$pbkdf2-sha256$`    | PBKDF2-HMAC-SHA256(Django)               | 10900      |
| `apr1$`              | MD5(APR)                                 | 1600       |
| `bcrypt$`            | bcrypt (OpenBSD)                         | 3200       |
| `bcrypt$`            | bcrypt (OpenBSD)                         | 3200       |
| `bcrypt$2a$`         | bcrypt                                   | 3200       |
| `bcrypt$2b$`         | bcrypt                                   | 3200       |
| `bcrypt$2x$`         | bcrypt                                   | 3200       |
| `bcrypt$2y$`         | bcrypt                                   | 3200       |
| `bcrypt-sha1$`       | bcrypt + SHA-1                           | 9100       |
| `bcrypt-sha256$`     | bcrypt + SHA-256                         | 1410       |
| `bcrypt-sha512$`     | bcrypt + SHA-512                         | 19500      |
| `blowfish$`          | bcrypt                                   | 3200       |
| `crypt$`             | Crypt                                    | 500        |
| `crypt-sha512$`      | SHA-512(Crypt)                           | 1800       |
| `LM`                 | LM                                       | 3000       |
| `md5$`               | MD5 (WordPress, Joomla)                  | 400        |
| `md5$`               | MD5 (WordPress, Joomla)                  | 400        |
| `md5apr1$`           | MD5(APR)                                 | 1600       |
| `md5crypt$`          | MD5(Unix)                                | 500        |
| `NTLM`               | NTLM                                     | 1000       |
| `pbkdf2-sha1$`       | PBKDF2-HMAC-SHA1 (Generic)               | 12000      |
| `pbkdf2-sha256$`     | PBKDF2-HMAC-SHA256 (Generic)             | 10900      |
| `scrypt$`            | scrypt                                   | 8900       |
| `sha1$`              | SHA-1(Django)                            | 12400      |
| `sha1$`              | SHA-1(Django)                            | 12400      |
| `sha256$`            | SHA-256(Django)                          | 1400       |
| `sha256$`            | SHA-256(Django)                          | 1400       |
| `sha256crypt$`       | SHA-256(Unix)                            | 7400       |
| `sha384$`            | SHA-384                                  | 10800      |
| `sha512$`            | SHA-512(Django)                          | 1710       |
| `sha512crypt$`       | SHA-512(Unix)                            | 1800       |
| `{bcrypt}`           | bcrypt (Blowfish)                        | 3200       |
| `{bcrypt-sha1}`      | bcrypt + SHA-1                           | 9000       |
| `{bcrypt-sha256}`    | bcrypt + SHA-256                         | 1410       |
| `{bcrypt-sha384}`    | bcrypt + SHA-384                         | 19500      |
| `{bcrypt-sha512}`    | bcrypt + SHA-512                         | 19500      |
| `{bcrypt}$2y$`       | bcrypt                                   | 3200       |
| `{CRYPT}`            | Crypt                                    | 500        |
| `{md5crypt}`         | MD5(Unix)                                | 500        |
| `{PKCS5S2}`          | PBKDF2 (Generic)                         | 10000      |
| `{SHA}`              | SHA-1                                    | 100        |
| `{SHA256}`           | SHA-256                                  | 1400       |
| `{SHA512}`           | SHA-512                                  | 1700       |
| `{SSHA}`             | Salted SHA-1                             | 111        |
| `{SSHA}`             | SSHA-1                                   | 111        |
| `{SSHA256}`          | Salted SHA-256                           | 1411       |
| `{SSHA256}`          | SSHA-256                                 | 1411       |
| `{SSHA512}`          | Salted SHA-512                           | 1711       |
| `{SSHA512}`          | SSHA-512                                 | 1711       |
