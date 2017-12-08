# functions
function extract_poweradmin {
  if [[ ! -e /var/www/html/poweradmin-2.1.7/ ]]
  then
    echo ":: Extracting poweradmin archive..."
    tar -C /var/www/html -zxf /var/www/html/v2.1.7.tar.gz
  fi
}

function checkConfig {
  f=/var/www/html/poweradmin-2.1.7/inc/config.inc.php
  if [[ ! -e "${f}" ]]
  then
    echo ":: Create file $f..."
    touch ${f}
  fi
  if [[ "www-data:www-data:-rw-rw----" != "$(stat --printf=\"%U:%G:%A\\n\" $f)" ]]
  then
    echo ":: Setting permissions..."
    chown www-data:www-data $f
    chmod 660 $f
  fi
}

before_service_start_hooks+=("extract_poweradmin")
before_service_start_hooks+=("checkConfig")
