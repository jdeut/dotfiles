local t = {}

t.leader = {
}

-- print('asddddddddd')

setmetatable(
   t.leader, {
      __index = function(t1, k1)
         -- print(string.format('__index k1:%s', k1))
         local keyseq = {}
         t1 = {}


         if k1 == 'Utils' then
            local m1 = 'j'

            t1[m1] = { name = k1 }

            table.insert(keyseq, t1)
            table.insert(keyseq, m1)

            setmetatable(t1, {
               __index = function(t2, m2)
                     setmetatable(
                        keyseq[1], {
                           __add = function(t1, t2)
                              (keyseq[1])[keyseq[2]][m2] = t2
                              return keyseq[1]
                           end
                        }
                     )
                     table.insert(keyseq, m2)
                     return keyseq[1]
                  end
            })
            -- print(vim.inspect(t1))
            return keyseq[1]
         end
      end
   }
)

return t
