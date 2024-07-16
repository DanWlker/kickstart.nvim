P = function(v)
  print(vim.inspect(v))
  return v
end

C = function(v)
  vim.fn.setreg('+', vim.inspect(v))
end

R = function(name)
  package.loaded[name] = nil
  require(name).setup()
end
