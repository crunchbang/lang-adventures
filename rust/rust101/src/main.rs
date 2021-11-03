use core::cmp::min;

fn main() {
    let v = read_numbers();
    let result = vec_min(v);
    result.print();

    let v2 = read_numbers();
    let sum = vec_sum(v2);
    sum.print();

    let v3 = read_numbers();
    vec_print(v3);
}

enum NumberOrNothing {
    Number(i32),
    Nothing,
}

impl NumberOrNothing {
    fn print(self) {
        match self {
            NumberOrNothing::Nothing => println!("The list is empty"),
            NumberOrNothing::Number(x) => println!("Value is {}", x),
        }
    }

    fn number_or_default(self, default: i32) -> i32 {
        match self {
            NumberOrNothing::Nothing => default,
            NumberOrNothing::Number(x) => x,
        }
    }
}

fn read_numbers() -> Vec<i32> {
    vec![2, 18, -1]
}

fn vec_min(vec: Vec<i32>) -> NumberOrNothing {
    let mut min_num = NumberOrNothing::Nothing;

    use self::NumberOrNothing::{Nothing, Number};
    for n in vec {
        min_num = match min_num {
            Nothing => Number(n),
            Number(x) => Number(min(x, n)),
        }
    }
    min_num
}

fn vec_sum(vec: Vec<i32>) -> NumberOrNothing {
    use self::NumberOrNothing::{Nothing, Number};

    let mut result = Nothing;
    for e in vec {
        result = match result {
            Nothing => Number(e),
            Number(x) => Number(x + e),
        };
    }
    result
}

fn vec_print(vec: Vec<i32>) {
    if 0 == vec.len() {
        print!("Empty vector")
    }

    for e in vec {
        print!("{} ", e);
    }

    println!();
}
