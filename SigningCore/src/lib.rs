/*
 * SideNeko
 *
 * Copyright (C) 2026 thanking157
 *
 * Original code and integration by thanking157.
 *
 * Licensed under the GNU General Public License v3.0.
 */

use std::ffi::{c_char, CStr};

static VERSION: &CStr = c"0.1.0";
static CAPABILITIES_WITHOUT_ENGINE: &CStr = c"{\"engine\":false,\"appleAccount\":false,\"signing\":false,\"installation\":false}";
static CAPABILITIES_WITH_ENGINE: &CStr = c"{\"engine\":true,\"appleAccount\":false,\"signing\":false,\"installation\":false}";

/// Returns a process-lifetime UTF-8 string. The caller must not free it.
#[unsafe(no_mangle)]
pub extern "C" fn sideneko_signing_core_version() -> *const c_char {
    VERSION.as_ptr()
}

/// Reports compile-time capability only. It does not claim that a real Apple
/// Account or device flow has passed validation.
#[unsafe(no_mangle)]
pub extern "C" fn sideneko_signing_core_capabilities_json() -> *const c_char {
    if cfg!(feature = "engine") {
        CAPABILITIES_WITH_ENGINE.as_ptr()
    } else {
        CAPABILITIES_WITHOUT_ENGINE.as_ptr()
    }
}

#[cfg(feature = "engine")]
mod engine {
    // Keep the dependency linked while the typed async FFI state machine is
    // implemented. No credential-taking entry point is exposed until Keychain,
    // redaction, cancellation, and host allow-list tests are present.
    #[allow(dead_code)]
    fn initialise_dependency() -> Result<(), String> {
        isideload::init().map_err(|error| error.to_string())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn version_is_stable_utf8() {
        assert_eq!(VERSION.to_str().unwrap(), "0.1.0");
    }

    #[test]
    fn capability_report_never_contains_secrets() {
        let value = if cfg!(feature = "engine") {
            CAPABILITIES_WITH_ENGINE
        } else {
            CAPABILITIES_WITHOUT_ENGINE
        };
        let text = value.to_str().unwrap();
        assert!(!text.contains("password"));
        assert!(!text.contains("token"));
        assert!(!text.contains("private"));
    }

    #[test]
    fn linked_dependency_does_not_claim_unimplemented_ffi() {
        let text = CAPABILITIES_WITH_ENGINE.to_str().unwrap();
        assert!(text.contains("\"engine\":true"));
        assert!(text.contains("\"appleAccount\":false"));
        assert!(text.contains("\"signing\":false"));
        assert!(text.contains("\"installation\":false"));
    }
}
