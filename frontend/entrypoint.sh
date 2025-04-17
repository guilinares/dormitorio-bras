#!/bin/sh

echo "${HOST_ADDRESS}"

cat <<EOF > /usr/share/nginx/html/env.js
(function (window) {
  window.__env = window.__env || {};
  window.__env.ip = "${HOST_ADDRESS}";
  window.__env.apiKeyFirebase = "${API_KEY_FIREBASE}"
})(this);
EOF

exec "$@"