use super::method::Method;
use std::convert::TryFrom;
use std::fmt::{Debug, Display, Result as FmtResult};

pub struct Request {
    method: Method,
    query_string: String,
    path: Option<String>,
}

impl TryFrom<&[u8]> for Request {
    type Error = String;

    fn try_from(_buf: &[u8]) -> Result<Self, Self::Error> {
        unimplemented!()
    }
}

pub enum ParseError {
    InvalidRequest,
    InvalidEncoding,
    InvalidProtocol,
    InvalidMethod,
}

impl ParseError {
    fn message(&self) -> &str {
        match &self {
            ParseError::InvalidEncoding => "Invalid Encoding",
            ParseError::InvalidProtocol => "Invalid Protocol",
            ParseError::InvalidRequest => "Invalid Request",
            ParseError::InvalidMethod => "Invalid Method",
        }
    }
}

impl Display for ParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> FmtResult {
        write!(f, "error {}", self.message())
    }
}

impl Debug for ParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> FmtResult {
        write!(f, "error {}", self.message())
    }
}
