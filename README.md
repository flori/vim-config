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

```bash
git clone --recursive https://github.com/flori/vim-config.git vim-config
cd vim-config
./install.sh
```

## 📁 Directory Structure

```
├── .vimrc                 # Main Vim configuration
├── .vim/                  # Custom syntax and colors
│   ├── after/syntax/ruby.vim  # Ruby-specific syntax rules
│   └── colors/flori.vim       # Custom color scheme
├── vim-plugins/           # Plugin directory (git submodules)
├── install.sh             # Installation script
├── plugin-add.sh          # Add new plugins
├── plugin-rm.sh           # Remove plugins
├── plugin-status.sh       # Show plugin status
└── plugin-update.sh       # Update all plugins
```

## 🎯 Key Mappings & Commands

For a complete overview of all key mappings and custom commands, please refer
to the [main configuration file](./.vimrc).

## 🔧 Requirements

- Vim 8.0+ with X11 support, clipboard integration, and cscope support
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
