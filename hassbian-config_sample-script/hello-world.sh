#!/bin/bash
function hello-world-show-short-info {
  echo "Sample script, prints 'Hello world!' to console."
}
function hello-world-show-long-info {
  echo "Sample script, prints 'Hello world!' to console."
}
function hello-world-show-copyright-info {
  echo "Concept by Ludeeus <https://github.com/ludeeus>."
}
function hello-world-install-package {
printf  "Hello world!\\n\\n"
return 0
}
function hello-world-upgrade-package {
printf "Hello World!\\n\\n"
return 0
}
[[ "$_" == "$0" ]] && echo "hassbian-config helper script; do not run directly, use hassbian-config instead"
