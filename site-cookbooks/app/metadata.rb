name              "app"
maintainer        "Mathias Hansen"
maintainer_email  "me@codemonkey.io"
description       "Main entry point for installing and configuring a dead-simple LAMP stack"
version           "1.0.0"

recipe "app", "Main entry point for installing and configuring a dead-simple LAMP stack"

depends "apache"
depends "dotdeb"
depends "php"
depends "apt"
depends "openssl"
depends "mysql"

%w{ debian ubuntu }.each do |os|
  supports os
end
