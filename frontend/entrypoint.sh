#!/bin/sh

cat <<EOF > /usr/share/nginx/html/assets/env.js
(function (window) {
  window.__env = window.__env || {};
  window.__env.ip = "${HOST_ADDRESS}";
})(this);
EOF

exec "$@"