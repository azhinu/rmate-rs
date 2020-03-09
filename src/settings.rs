use std::ffi::OsString;
use std::path::PathBuf;

pub struct Settings {
    pub host: String,
    pub port: u16,
    pub wait: bool,
    pub force: bool,
    pub verbose: u8,
    pub names: Vec<OsString>,
    pub files: Vec<OsString>,
}

// use std::collections::hash_map::HashMap;

pub(crate) struct OpenedBuffer {
    pub(crate) path: PathBuf,
    pub(crate) name: OsString,
    pub(crate) canwrite: bool,
    pub(crate) size: usize,
}

// type MyItems<String, OpenedBuffers> = HashMap<String, OpenedBuffers>;

impl Settings {
    pub fn new(port: u16) -> Self {
        Settings {
            port: port,
            ..Default::default()
        }
    }
}

impl Default for Settings {
    fn default() -> Self {
        Settings {
            host: "localhost".to_string(),
            port: 52696,
            wait: false,
            force: false,
            verbose: 0,
            names: vec![],
            files: vec![],
        }
    }
}
