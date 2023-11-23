use log::info;

pub fn func_string_twin_normal(arg: String) -> String {
    arg
}

#[allow(clippy::unused_unit)]
pub fn func_return_unit_twin_normal() -> () {}

pub fn handle_list_of_struct(mut l: Vec<MySize>) -> Vec<MySize> {
    info!("handle_list_of_struct({:?})", &l);
    let mut ans = l.clone();
    ans.append(&mut l);
    ans
}

pub fn handle_string_list(names: Vec<String>) -> Vec<String> {
    for name in &names {
        info!("Hello, {}", name);
    }
    names
}
