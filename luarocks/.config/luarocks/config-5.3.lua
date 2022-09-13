local_by_default = true
lua_interpreter = 'lua5.3'
rocks_trees = {
   {
      root = '/home/johannes/.luarocks'
   },
   {
      root = '/usr',
      lib_dir = '/usr/lib/x86_64-linux-gnu/lua/' .. lua_version
   },
}
