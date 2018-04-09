require('prelude')

Vector = Template({
	x = Number,
	y = Number
})

function print_vec($Vector$ v)
	print(string.format("(%d, %d)", v.x, v.y))
end

v1 = {x=1, y=2}
print_vec(v1)

v2 = {x=1, y=""}
print_vec(v2)
