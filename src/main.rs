extern crate getopts;

use std::fs::File;
use std::io::{Read, Write};

mod cli;
mod compiler;

fn main() {
	let config = cli::get_config();

	let mut infile = File::open(config.inputfile).unwrap();
	let mut s = String::new();
	infile.read_to_string(&mut s).unwrap();

	let compiled = compiler::compile(&s, &config.mode);

	let mut outfile = File::create(config.outputfile).unwrap();
	outfile.write(compiled.as_bytes()).unwrap();
}
