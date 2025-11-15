# 🐚 Vim Configuration

A comprehensive, highly customized Vim configuration optimized for modern
development workflows with extensive plugin support and intelligent
project-aware settings.

## 📦 Features

### Core Components
- **Pathogen-based plugin management** with git submodules
- **Custom `flori` color scheme** with terminal/GUI compatibility
- **Advanced Ruby syntax highlighting** with semantic variable coloring
- **Project-aware configuration** with dynamic path resolution
- **FZF integration** for blazing-fast file/finder operations

### Language Support
- Ruby (with custom syntax rules and indentation)
- C/C++
- JavaScript/TypeScript
- HTML/XML
- JSON, Markdown, and more

### Development Tools
- **Code navigation**: Tags, cscope, and grep integration
- **Testing support**: Probe integration for test debugging
- **AI assistance**: Ollama chat integration
- **Git integration**: Fugitive plugin support
- **Code formatting**: Automatic formatting on save

## 🚀 Quick Setup

Before installing, make sure you have GNU Stow installed:

- On Debian/Ubuntu: `sudo apt install stow`

- On macOS with Homebrew: `brew install stow`

- On your OS …

This ensures that the `install.sh` script can properly create symlinks in your home directory using GNU Stow.

```bash
git clone --recurse-submodules https://github.com/flori/vim-config.git vim-config
cd vim-config
./install.sh
```

## 🎯 Key Mappings & Commands

For a complete overview of all key mappings and custom commands, please refer
to the [main configuration file](./.vimrc).

## 🔧 Requirements

- Vim 8.0+ with X11 support, clipboard integration, and cscope support
- GNU Stow for installation/deinstallation
- Git for plugin management
- FZF for enhanced search capabilities
- External tools from Ruby gems:
  - [`utils`](https://github.com/flori/utils) gem: `discover`, `create_tags`, `create_cstags`, `edit`, `probe`, `classify`, `code_comment`
  - [`ollama_chat`](https://github.com/flori/ollama_chat) gem: `ollama_chat_send` for Ollama integration

## 🛠️ Plugin Management

```bash
# Add new plugin
./plugin-add.sh https://github.com/user/plugin.git

# Update all plugins
./plugin-update.sh

# Check plugin status
./plugin-status.sh

# Remove plugin
./plugin-rm.sh vim-plugins/plugin-name

# Uninstall vim-config
./uninstall.sh
```

## 💡 Tips

1. **Project-specific settings**: Place `.utilsrc` files for the `utils` gem in
   project roots for custom path configuration
2. **Color schemes**: Works best with 256-color terminals
3. **Performance**: Plugins are loaded lazily for faster startup times
4. **Customization**: Easy to modify color schemes and mappings

## 📄 License

This configuration is licensed under the [MIT](./LICENSE) license.

## 🧑‍💻 Author

[Florian Frank](mailto:flori@ping.de)
