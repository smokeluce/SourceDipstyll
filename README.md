# SourceDipstyll

![Status](https://img.shields.io/badge/status-active-brightgreen)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Language](https://img.shields.io/badge/powershell-5.1%2B-lightgrey)
![License](https://img.shields.io/badge/license-MIT-purple)

**SourceDipstyll** creates a clean‑room snapshot of your project by distilling real source files into portable text copies with preserved structure, perfect for debugging, sharing, or deep analysis.

---

## Features

- Recursively extracts:
  - `.cs`
  - `.axaml`
  - `.axaml.cs`
  - `.csproj`
- Preserves full directory structure
- Converts each file into a safe `.txt` version
- Excludes build/IDE clutter:
  - `/bin`
  - `/obj`
  - `/.vs`
  - `/.idea`
  - `/.vscode`
  - `/packages`
- Generates `projecttree.txt` for easy reconstruction
- Produces a clean, portable snapshot ideal for:
  - AI analysis
  - Code review
  - Debugging
  - Archival

---

## Usage

1. Place your project path inside `SourceDipstyll.ps1`:
   ```powershell
   $source = "E:\Path\To\YourProject"

   # ## Usage

 2. Run the script:
    ```powershell
    powershell -ExecutionPolicy Bypass -File SourceDipstyll.ps1
    ```
 
 3. Your distilled snapshot appears on your Desktop under:
    ```
    \psyircforcopilot
    ```
 
 Or simply double‑click `SourceDipstyll.bat`.
 
 ---
 
 ## Output Example
 
 ```
 psyircforcopilot/
 │   projecttree.txt
 │
 └───YourProject/
     ├───Views/
     │       MainWindow.axaml.txt
     │       MainWindow.axaml.cs.txt
     ├───Models/
     │       User.cs.txt
     └───YourProject.csproj.txt
 ```
 
 ---
 
 ## Assets
 
 The `assets/` folder contains the SourceDipstyll logo and any future branding elements.
 
 ---
 
 ## License
 
 MIT — free to use, modify, and extend.