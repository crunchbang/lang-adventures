use self::SomethingOrNothing::{Nothing, Something};

fn main() {
    let v = read_numbers();
    let result = vec_min(v);
    result.print();

    let v2 = read_numbers();
    let sum = vec_sum(v2);
    sum.print();

    let v3 = read_numbers();
    vec_print(v3);

    let r4 = vec_min(vec![11.0, 1.2, 2.3, 3.4, 4.5]);
    r4.print();
}

trait Minimum {
    fn min(self, b: Self) -> Self;
}

impl Minimum for i32 {
    fn min(self, b: Self) -> Self {
        if self < b {
            self
        } else {
            b
        }
    }
}

impl Minimum for f32 {
    fn min(self, b: Self) -> Self {
        if self < b {
            self
        } else {
            b
        }
    }
}

enum SomethingOrNothing<T> {
    Something(T),
    Nothing,
}

impl<T> SomethingOrNothing<T> {
    fn new(o: Option<T>) -> Self {
        match o {
            Some(x) => Something(x),
            None => Nothing,
        }
    }

    fn to_option(self) -> Option<T> {
        match self {
            Something(x) => Some(x),
            Nothing => None,
        }
    }
}

type NumberOrNothing = SomethingOrNothing<i32>;

impl SomethingOrNothing<f32> {
    fn print(self) {
        match self {
            Nothing => println!("The list is empty"),
            Something(x) => println!("Value is {}", x),
        }
    }
}

impl NumberOrNothing {
    fn print(self) {
        match self {
            Nothing => println!("The list is empty"),
            Something(x) => println!("Value is {}", x),
        }
    }
}

fn read_numbers() -> Vec<i32> {
    vec![18, 5, 7, 3, 9, 27]
}

fn vec_min<T: Minimum>(vec: Vec<T>) -> SomethingOrNothing<T> {
    let mut min = Nothing;

    for e in vec {
        min = match min {
            Nothing => Something(e),
            Something(x) => Something(x.min(e)),
        }
    }
    min
}

fn vec_sum(vec: Vec<i32>) -> NumberOrNothing {
    let mut result = Nothing;
    for e in vec {
        result = match result {
            Nothing => Something(e),
            Something(x) => Something(x + e),
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
