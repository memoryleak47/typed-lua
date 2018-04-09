require("prelude")

function sum($List(Number)$ l)
	s = 0
	for _, v in pairs(l) do
		s = s + v
	end
	return s
end

print(sum({1, 2, 3}))
print(sum({1, 2, "f"}))
