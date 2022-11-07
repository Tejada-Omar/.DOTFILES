P = function(val) print(vim.inspect(val)) end

RELOAD = function(...) return require('plenary.reload').reload_module(...) end

R = function(val)
  RELOAD(val)
  return require(val)
end
