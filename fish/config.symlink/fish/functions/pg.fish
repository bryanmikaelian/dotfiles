function pgs
  switch ($argv[0])
    case start
      pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/pgsql/server.log start -w
    case stop
      pg_ctl -D /usr/local/var/postgres/ stop -s -m fast
  end
end
