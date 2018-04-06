X = function(t) return (function(t) return type(t) == "number" end)(t) and (function(x) return x == 2 end)(t) end

function foo(x) assert(X(x))
	print(x)
end
