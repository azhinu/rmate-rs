use std::ffi::OsString;
use std::fs::{File, Metadata};
use std::path::PathBuf;

#[derive(Debug)]
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

#[derive(Debug)]
pub(crate) struct OpenedBuffer {
    pub(crate) canon_path: PathBuf,
    pub(crate) display_name: OsString,
    pub(crate) canwrite: bool,
    pub(crate) metadata: Metadata,
    pub(crate) temp_file: File,
    pub(crate) size: u64,
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
