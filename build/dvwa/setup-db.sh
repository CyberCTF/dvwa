#!/bin/sh
# Runs DVWA's "Create / Reset Database" (setup.php) once Apache and the database answer, so the
# lab starts ready: log in as admin / password. Skipped when the users table already exists, so a
# restart keeps the database as the player left it.
users_table() {
  php -r 'exit(@mysqli_connect(getenv("DB_SERVER"),"dvwa","p@ssw0rd","dvwa")?->query("SELECT 1 FROM users LIMIT 1") ? 0 : 1);' 2>/dev/null
}
token() {
  curl -fsS -c "$jar" -b "$jar" http://127.0.0.1/setup.php |
    sed -n "s/.*name='user_token' value='\([0-9a-f]*\)'.*/\1/p" | head -n 1
}
jar=/tmp/dvwa-setup.cookies
for i in $(seq 1 150); do
  if users_table; then echo "dvwa-setup-db: database ready"; rm -f "$jar"; exit 0; fi
  t=$(token 2>/dev/null)
  if [ -n "$t" ]; then
    curl -fsS -c "$jar" -b "$jar" -o /dev/null \
      --data-urlencode "create_db=Create / Reset Database" --data-urlencode "user_token=$t" \
      http://127.0.0.1/setup.php 2>/dev/null
  fi
  sleep 2
done
echo "dvwa-setup-db: database setup failed"; exit 1
