# DVWA

[DVWA](https://github.com/digininja/DVWA) (Damn Vulnerable Web Application) by Robin Wood and the
DVWA contributors: a PHP/MariaDB web application that is damn vulnerable, with one module per
common web vulnerability. This repository runs it with [Isoloom](https://www.isoloom.com):
[`isoloom.yml`](isoloom.yml) describes the machines, and the upstream source in
[`build/dvwa/app/`](build/dvwa/app) builds with its own Dockerfile, with the database host baked
in and the database created at first start.

| Machine | Service |
| --- | --- |
| dvwa | DVWA (PHP, Apache) on port 80, published on 4280 |
| db | MariaDB 10.11 on port 3306 |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:4280/ and log in as `admin` / `password`. The database is already
created; set the level on the DVWA Security page. The same spec runs as Docker on a local VM
(`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the
[DVWA README](https://github.com/digininja/DVWA#readme) and the help page of each module.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-3.0, as DVWA ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
