use std::io::{self, Read};
use serde::Deserialize;

fn main() {
    let mut buffer = String::new();
    io::stdin().read_to_string(&mut buffer).expect("Error reading from STDIN");
    let obj: FaasInput = serde_json::from_str(&buffer).unwrap();
    let key1 = &(obj.key1);
    let key2 = &(obj.key2);
    println!("Hello! {}, {}", key1, key2);
}

#[derive(Deserialize, Debug)]
struct FaasInput {
    key1: String,
    key2: String
}
