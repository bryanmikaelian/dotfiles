if [ -s $HOME/.awsam/bash.rc ]; then
  source $HOME/.awsam/bash.rc
fi

export SL_API_DB="mysql2://metrics:@localhost/metrics_development"
export SL_API_TEST_DB="mysql2://metrics:@localhost/metrics_test"
export SL_API_TSSTORE_URI=cassandra://127.0.0.1
export SL_API_URI="http://0.0.0.0:9292"

export METRICS_API_SITE="http://0.0.0.0:9292"
export METRICS_TEST_API_SITE="http://0.0.0.0:9292"
export SPACES_API_URI="http://api.librato.dev"
export SPACES_TEST_API_URI="http://0.0.0.0:9292"
export SPACES_DIRECT_API="http://0.0.0.0:9292"

export SSL_CERT_FILE="/Users/bryanmikaelian/.ssl/cacert.pem"
export SEGMENTIO_SECRET_KEY=JuKYxjuTP06OAxA923aBIDE3CTS08xsI
