local function badFormat(a, b)
  local x = a .. b
  print(x)
  if x then
    for i = 1, #x do
      print(i, x[i])
    end
  end
  return x
end
