#!/bin/sh

echo "${HOST_ADDRESS}"

cat <<EOF > /usr/share/nginx/html/env.js
(function (window) {
  window.__env = window.__env || {};
  window.__env.ip = "${HOST_ADDRESS}";
})(this);
EOF

exec "$@"