local utils = require "mp.utils"

package.path = utils.join_path(
      utils.join_path(
         mp.find_config_file('scripts'),
         mp.get_script_name()
      ),
      'remote/?.lua;'
   ) .. package.path

require'remote.subs2srs'
