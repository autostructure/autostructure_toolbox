#
# This module contains dev tools for Continuous Delivery for Puppet Enterprise agents
#
class autostructure_toolbox (
  ) {

    contain autostructure_toolbox::packages
    contain autostructure_toolbox::agent

    Class['::autostructure_toolbox::packages']
    -> Class['::autostructure_toolbox::agent']
  }
