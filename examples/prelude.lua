function OfType(s) return function(o) return type(o) == s end end

Nil = OfType("nil")
Number = OfType("number")
String = OfType("string")
Function = OfType("function")
Table = OfType("table")

function Or(X, Y)
	return function(o)
		return X(o) or Y(o)
	end
end

function And(X, Y)
	return function(o)
		return X(o) and Y(o)
	end
end

function Not(X)
	return function(o)
		return not X(o)
	end
end

function List(C)
	return function(o)
		if not Table(o) then return false end

		for k, v in pairs(o) do
			if not C(v) then return false end
			if not Number(k) then return false end
		end

		return true
	end
end

function Template(template)
	return function(o)
		for k, v in pairs(template) do
			if not v(o[k]) then return false end
		end

		return true
	end
end
