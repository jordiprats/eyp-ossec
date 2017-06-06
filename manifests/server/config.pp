# concat /var/ossec/etc/shared/agent.conf
#
# 0 header
# <os>1 agent config
# <os>2 directories
# <os>3 ignores
# <os>4 syscheck end
# <os>5 localfile
# <os>6 rootcheck
# <os>10 agent_config end
#
class ossec::server::config inherits ossec::server {

  #/var/ossec/etc/shared/agent.conf
  concat { '/var/ossec/etc/shared/agent.conf':
    ensure  => 'present',
    owner   => 'ossec',
    group   => 'ossec',
    mode    => '0640',
  }

  concat::fragment{ '/var/ossec/etc/shared/agent.conf header':
    target  => '/var/ossec/etc/shared/agent.conf',
    order   => '0',
    content => template("${module_name}/shared_agent/00_header.erb"),
  }

}
