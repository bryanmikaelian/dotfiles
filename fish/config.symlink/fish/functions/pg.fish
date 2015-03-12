function pg
  switch ($argv)
    case start
      pg_ctl -D /usr/local/var/pgsql/ -l /usr/local/var/pgsql/server.log start -w
    case stop
      pg_ctl -D /usr/local/var/postgres/ stop -s -m fast
  end
end
