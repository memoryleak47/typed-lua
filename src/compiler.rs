use cli::Mode;

enum State {
	Normal,
	InType,
	InName,
	PreArg,
}

pub fn compile(s: &str, mode: &Mode) -> String {
	let mut out = String::new();
	let mut state = State::Normal;

	let mut args: Vec<(String, String)> = Vec::new();
	let mut current_arg: (String, String) = (String::new(), String::new());

	for c in s.chars() {
		state = match (state, c) {
			(State::Normal, '$') => State::InType,
			(State::Normal, c) => {
				out.push(c);
				State::Normal
			},

			(State::InType, '$') => State::InName,
			(State::InType, c) => {
				current_arg.0.push(c);
				State::InType
			},

			(State::InName, ',') => {
				out.push(',');
				args.push(current_arg);
				current_arg = (String::new(), String::new());
				State::PreArg
			},
			(State::InName, ')') => {
				out.push(')');
				args.push(current_arg);
				current_arg = (String::new(), String::new());
				if mode.is_debug() {
					for arg in args {
						if !arg.0.is_empty() {
							out.push_str(&format!("assert(({0})({1}), 'variable {1:?} does not match type {0:?}');", arg.0.trim(), arg.1.trim()));
						}
					}
				}
				args = Vec::new();
				State::Normal
			},
			(State::InName, c) => {
				out.push(c);
				current_arg.1.push(c);
				State::InName
			},

			(State::PreArg, '$') => State::InType,
			(State::PreArg, c) if c.is_whitespace() => {
				out.push(c);
				State::PreArg
			}
			(State::PreArg, c) => {
				out.push(c);
				current_arg.1.push(c);
				State::InName
			}
		};
	}

	out
}
