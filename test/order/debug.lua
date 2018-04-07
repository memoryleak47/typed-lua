function(a, b, c) end

function( a, b, c)assert((x)(a), 'variable "a" does not match type "x"'); end
function(a,  b, c)assert((y)(b), 'variable "b" does not match type "y"'); end
function(a, b,  c)assert((z)(c), 'variable "c" does not match type "z"'); end

function( a,  b, c)assert((x)(a), 'variable "a" does not match type "x"');assert((y)(b), 'variable "b" does not match type "y"'); end
function( a, b,  c)assert((x)(a), 'variable "a" does not match type "x"');assert((z)(c), 'variable "c" does not match type "z"'); end
function(a,  b,  c)assert((y)(b), 'variable "b" does not match type "y"');assert((z)(c), 'variable "c" does not match type "z"'); end

function( a,  b,  c)assert((x)(a), 'variable "a" does not match type "x"');assert((y)(b), 'variable "b" does not match type "y"');assert((z)(c), 'variable "c" does not match type "z"'); end
