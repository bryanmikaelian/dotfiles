if [ -s $HOME/.awsam/bash.rc ]; then
  source $HOME/.awsam/bash.rc
fi

export SL_API_DB="mysql2://metrics:@127.0.0.1/metrics_development"
export SL_API_TEST_DB="mysql2://metrics:@127.0.0.1/metrics_test"
export SL_API_TSSTORE_URI=cassandra://127.0.0.1
export SL_API_URI="http://0.0.0.0:9292"

export METRICS_API_SITE="http://api.librato.dev:9292"
export METRICS_TEST_API_SITE="http://api.librato.dev:9292"
export SPACES_API_URI="http://api.librato.dev:8081"
export SPACES_TEST_API_URI="http://api.librato.dev:9292"
export SPACES_DIRECT_API="http://api.librato.dev:9292"
export SDK_API_URI="http://api.librato.dev:9292"
# export MEMCACHE_URI="http://0.0.0.0:11211"
export QC_DATABASE_URL="postgres://librato_worker:@localhost:5432/librato_workers"

export SSL_CERT_FILE="${HOME}/.ssl/cacert.pem"
export SEGMENTIO_SECRET_KEY=JuKYxjuTP06OAxA923aBIDE3CTS08xsI

export DOCKER_LOCALDEV_MODULES="librato-data,librato-web"
# export DEV_MODULES="core;librato-data;librato-web"

