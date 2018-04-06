function Number(t) return type(t) == "number" end

function foo( x)assert((Number)( x));
	print(x)
end
