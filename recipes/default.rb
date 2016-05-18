#
# Cookbook: updatedb
#
# Copyright (c) 2016 Bloomberg L.P., All Rights Reserved.
#

updatedb node['updatedb']['service_name'] do |r|
    node['updatedb']['config'].each_pair { |k, v| r.send(k, v) }
end
