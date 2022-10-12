local load = function (mod)
  package.loaded[mod] = nil
  return require(mod)
end

load('omar/settings')
load('omar/keymaps')
load('omar/autocmd')
load('omar/plugins')
load("omar/global")
