use std::io;

fn main() {
    println!("Enter your weight: ");

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    let earth_weight: f32 = input.trim().parse().unwrap();
    let mut mars_weight = calculate_weight_on_mars(earth_weight);
    mars_weight = mars_weight * 1000.0;
    println!("Weight on Mars: {}g", mars_weight);
}

fn calculate_weight_on_mars(weight: f32) -> f32 {
    (weight / 9.81) * 3.711
}
