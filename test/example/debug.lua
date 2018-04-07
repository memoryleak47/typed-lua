function Number(t) return type(t) == "number" end

function foo( x)assert((Number)(x), 'variable "x" does not match type "Number"');
	print(x)
end
