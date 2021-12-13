local t = {}

t.dialog = function(text)
   local window = widget{ type  = 'window' }
   local label = widget{ type = 'label' }

   window.tooltip = ''
   window.min_size = { 100, 100}
   window.title = 'Dialog'
   window.child = label

   label.text = text
   label.margin = 20

   window:add_signal('destroy', function(v) 
         label:destroy()
      end
   )

   window:set_default_size(100,100)
   window:show()
end

return t
