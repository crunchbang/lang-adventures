use crate::http::Request;
use std::convert::TryFrom;
use std::io::Read;
use std::net::TcpListener;

pub struct Server {
    addr: String,
}

impl Server {
    pub fn new(addr: String) -> Self {
        Self { addr }
    }

    pub fn run(self) {
        println!("Listening on {}", self.addr);

        let listener = TcpListener::bind(&self.addr).unwrap();

        loop {
            match listener.accept() {
                Ok((mut stream, client_addr)) => {
                    println!("Got a connection from {}", client_addr);
                    // statically allocate an array for use as the buffer
                    let mut buffer = [0; 1024];
                    match stream.read(&mut buffer) {
                        Ok(n) => {
                            println!(
                                "Received data {} bytes of data {}",
                                n,
                                String::from_utf8_lossy(&buffer)
                            );
                            match Request::try_from(&buffer[..]) {
                                Ok(request) => {}
                                Err(e) => {
                                    println!("Error while coverting payload to request {}", e)
                                }
                            }
                        }
                        Err(e) => {
                            println!("Failed to read data: {}", e);
                        }
                    }
                }
                Err(e) => {
                    println!("Error while accepting connection {}", e);
                    continue;
                }
            }
        }
    }
}
