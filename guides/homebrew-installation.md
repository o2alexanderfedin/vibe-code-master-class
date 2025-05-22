# 🍺 Homebrew Installation Guide

This guide provides detailed instructions for installing Homebrew on macOS, which is a prerequisite for many development tools including Node.js needed for Claude Code.

## What is Homebrew?

Homebrew is a free and open-source package management system that simplifies the installation of software on macOS and Linux. It's often called "the missing package manager for macOS" and is essential for developers.

## Prerequisites

- A Mac running macOS 10.15 (Catalina) or higher
- Command Line Tools for Xcode
- Administrator access to your Mac

## Installation Steps

### Step 1: Install Command Line Tools for Xcode

Before installing Homebrew, you need to install Command Line Tools for Xcode:

```bash
xcode-select --install
```

A dialog box will appear asking if you want to install the tools. Click "Install" and wait for the installation to complete.

### Step 2: Install Homebrew

Open Terminal and run the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This will download and run the Homebrew installation script. You may be prompted for your password during installation.

### Step 3: Add Homebrew to your PATH

After installation, you need to add Homebrew to your PATH:

**For Intel Macs:**
```bash
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

**For Apple Silicon Macs (M1, M2, etc.):**
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

> **Note:** If you're using Bash instead of Zsh, replace `.zshrc` with `.bash_profile` in the commands above.

### Step 4: Verify Installation

Verify that Homebrew is installed correctly:

```bash
brew --version
```

You should see output like:
```
Homebrew 4.0.28
```

### Step 5: Update Homebrew

It's always a good idea to update Homebrew after installation:

```bash
brew update
```

## Troubleshooting

### "Command not found: brew"

If you see this error after installation:

1. Check if Homebrew was installed:
   - For Intel Macs, check if `/usr/local/bin/brew` exists
   - For Apple Silicon Macs, check if `/opt/homebrew/bin/brew` exists

2. If it exists, add it to your PATH manually:
   ```bash
   # For Intel Macs
   eval "$(/usr/local/bin/brew shellenv)"
   
   # For Apple Silicon Macs
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```

3. Add the appropriate line to your shell profile:
   ```bash
   # For Intel Macs
   echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
   
   # For Apple Silicon Macs
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
   ```

### Installation Script Fails

If the installation script fails:

1. Make sure you have Command Line Tools for Xcode installed:
   ```bash
   xcode-select --install
   ```

2. Check your internet connection

3. Try running with sudo if prompted:
   ```bash
   sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

### Permissions Issues

If you encounter permissions issues:

```bash
sudo chown -R $(whoami):admin /usr/local/*
sudo chmod -R g+rwx /usr/local/*
```

For Apple Silicon Macs, replace `/usr/local/*` with `/opt/homebrew/*`.

## Uninstalling Homebrew

If you need to uninstall Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```

## Next Steps

After installing Homebrew, you can use it to install Node.js for Claude Code:

```bash
brew install node
```

For more information, visit the [official Homebrew website](https://brew.sh/).