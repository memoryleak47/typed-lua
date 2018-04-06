use std::env;
use getopts::Options;

pub enum Mode {
	Debug,
	Release
}

impl Mode {
	#[allow(dead_code)]
	pub fn is_release(&self) -> bool {
		match self {
			Mode::Release => true,
			Mode::Debug => false,
		}
	}

	pub fn is_debug(&self) -> bool {
		match self {
			Mode::Debug => true,
			Mode::Release => false,
		}
	}
}

pub struct Config {
	pub inputfile: String,
	pub outputfile: String,
	pub mode: Mode,
}

pub fn get_config() -> Config {
	let args: Vec<String> = env::args().collect();

	let mut opts = Options::new();
	//opts.reqopt("");
	opts.optopt("o", "output", "output file name", "NAME");
	opts.optflag("", "release", "runs in release mode");
	opts.optflag("", "debug", "runs in debug mode");

    let matches = match opts.parse(&args[1..]) {
        Ok(m) => m,
        Err(f) => panic!(f.to_string()),
    };

	if matches.opt_present("release") && matches.opt_present("debug") {
		panic!("can't run with --release and --debug");
	}

	Config {
		inputfile: matches.free.get(0).expect("missing inputfile argument").to_string(),
		outputfile: matches.opt_str("o").unwrap_or_else(|| "a.out".to_string()),
		mode: if matches.opt_present("release") { Mode::Release } else { Mode::Debug },
	}
}
