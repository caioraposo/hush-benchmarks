fn mss(v: &[i32], i: usize) -> i32 {
	if i == 0 {
		v[0]
	} else {
		i32::max(mss(v, i-1) + v[i], v[i])
	}
}

fn main() {
	let v = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7];

	let mut ans = 0;
	for i in 0..v.len() {
		ans = i32::max(ans, mss(&v, i));
	}
    println!("{}", ans);
}
