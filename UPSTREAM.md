# Upstream

| | |
| --- | --- |
| Project | DVWA (Damn Vulnerable Web Application) |
| Repository | https://github.com/digininja/DVWA |
| Version | 2.5 |
| Commit | a96943dc1f52f390ee5df72144660636c4b7dd06 |
| Licence | GPL-3.0 |

`build/dvwa/app/` is that commit, unchanged, without its Git history. `build/dvwa/Dockerfile` is
upstream's Dockerfile with these changes: the PHP base image is pinned to `php:8.5-apache`,
`DB_SERVER=db` is baked in (upstream's `compose.yml` sets it at run time), and the container runs
`setup-db.sh` in the background at start, which runs DVWA's "Create / Reset Database" once.
`build/db/Dockerfile` is the MariaDB of upstream's `compose.yml` (`mariadb:10`, pinned to 10.11)
with its environment values baked in. To update, replace `build/dvwa/app/` with a newer release,
then change this table.
