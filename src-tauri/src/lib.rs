// Template application state
#[derive(Default)]
pub struct AppState {
    // Add your application state here
    // Example: pub config: Arc<RwLock<Config>>,
}

// Example Tauri command
#[tauri::command]
async fn greet(name: String) -> Result<String, String> {
    Ok(format!("Hello, {}! You've been greeted from Rust!", name))
}

// Example async command with state
#[tauri::command]
async fn get_app_info(
    _state: tauri::State<'_, AppState>
) -> Result<String, String> {
    Ok("Tauri Template v1.0.0".to_string())
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_opener::init())
        .plugin(tauri_plugin_http::init())
        .plugin(tauri_plugin_fs::init())
        .plugin(tauri_plugin_clipboard_manager::init())
        .plugin(tauri_plugin_dialog::init())
        .plugin(tauri_plugin_shell::init())
        .plugin(tauri_plugin_notification::init())
        .plugin(tauri_plugin_os::init())
        .manage(AppState::default())
        .invoke_handler(tauri::generate_handler![
            greet,
            get_app_info
        ])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}