function(a, b, c) end

function( a, b, c)assert((x)( a)); end
function(a,  b, c)assert((y)( b)); end
function(a, b,  c)assert((z)( c)); end

function( a,  b, c)assert((x)( a));assert((y)( b)); end
function( a, b,  c)assert((x)( a));assert((z)( c)); end
function(a,  b,  c)assert((y)( b));assert((z)( c)); end

function( a,  b,  c)assert((x)( a));assert((y)( b));assert((z)( c)); end
