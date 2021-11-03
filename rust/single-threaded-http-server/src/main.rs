use http::Method;
use http::Request;
use server::Server;

mod http;
mod server;

fn main() {
    let address = "0.0.0.0:8080";
    let server = Server::new(address.to_string());
    server.run();
}
