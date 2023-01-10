use std::env;
use rand::Rng;

fn main() {
    let args: Vec<String> = env::args().collect();
    let n: usize = args[1].parse().unwrap();
    let mut rng = rand::thread_rng();

    let mut chars: Vec<u8> = vec![0; n];
    for el in &mut chars {
        let mut ch = rng.gen_range(65..117);
        if ch > 90 {
            ch += 6;
        }
        *el = ch;
    }

    let rand_str = String::from_utf8(chars).unwrap();
    print!("{}", rand_str);
}

