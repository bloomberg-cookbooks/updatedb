# UpdateDB Cookbook
[![License](https://img.shields.io/badge/license-Apache_2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Cookbook which configures UpdateDB.

## Platforms
The following platforms are tested using Test Kitchen:

- Ubuntu 12.04/14.04/16.04
- CentOS (RHEL) 5/6/7

## Basic Usage
The [default recipe](recipes/default.rb) gives you the ability to pass attributes to tune all of the settings in the updatedb config file.
There are currently defaults set in the [attributes](attributes/default.rb). You can modify these as you please.  
You can tweak the settings in the Policefile.rb or directly using attributes. All UpdateDB specific settings
should use underscores like the examples below.

### Recipe
```ruby
default['updatedb']['config']['settings']['prune_bind_mounts'] = 'yes'
default['updatedb']['config']['settings']['prunenames'] = '.git .bzr .hg .svn'
default['updatedb']['config']['settings']['prunefs'] = '/tmp /var/spool /media /home/.ecryptfs'
default['updatedb']['config']['settings']['prunepaths'] = 'NFS nfs nfs4 rpc_pipefs afs binfmt_misc proc smbfs autofs iso9660 ncpfs coda devpts ftpfs devfs mfs shfs sysfs cifs lustre tmpfs usbfs udf fuse.glusterfs fuse.sshfs curlftpfs ecryptfs fusesmb devtmpfs'
```

### Policyfile
``` ruby
name 'updatdb'
default_source :community
cookbook 'updatedb', git: 'https://github.com/acaiafa/updatedb-cookbook'
run_list 'updatedb::default'
default['updatedb']['config']['settings']['prune_bind_mounts'] = 'yes'

override['updatedb']['config']['settings']['prunenames'] = '.git .bzr .hg .svn'
override['updatedb']['config']['settings']['prunefs'] = '/tmp /var/spool /media /home/.ecryptfs'
override['updatedb']['config']['settings']['prunepaths'] = 'NFS nfs nfs4 rpc_pipefs afs binfmt_misc proc smbfs autofs iso9660 ncpfs coda devpts ftpfs devfs mfs shfs sysfs cifs lustre tmpfs usbfs udf fuse.glusterfs fuse.sshfs curlftpfs ecryptfs fusesmb devtmpfs'
```

