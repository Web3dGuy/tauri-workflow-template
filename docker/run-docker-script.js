#!/usr/bin/env node

/**
 * Cross-platform runner for Docker menu scripts
 * Automatically selects PowerShell or Bash based on OS
 */

import { spawn } from 'child_process';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import process from 'process';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Get command from arguments
const args = process.argv.slice(2);

// Determine script and command based on platform
const isWindows = process.platform === 'win32';
const scriptDir = __dirname;

if (isWindows) {
    // Windows: Use PowerShell
    const scriptPath = join(scriptDir, 'docker-menu.ps1');
    const psArgs = ['-File', scriptPath, ...args];
    
    const child = spawn('powershell', psArgs, {
        stdio: 'inherit',
        shell: false
    });
    
    child.on('exit', (code) => {
        process.exit(code || 0);
    });
} else {
    // Unix-like: Use bash script
    const scriptPath = join(scriptDir, 'docker-menu.sh');
    
    const child = spawn(scriptPath, args, {
        stdio: 'inherit',
        shell: false
    });
    
    child.on('exit', (code) => {
        process.exit(code || 0);
    });
    
    child.on('error', (err) => {
        if (err.code === 'EACCES') {
            console.error(`Error: ${scriptPath} is not executable.`);
            console.error('Run: chmod +x docker/docker-menu.sh');
            process.exit(1);
        } else {
            throw err;
        }
    });
}