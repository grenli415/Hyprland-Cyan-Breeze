#!/bin/bash
# Автоматический установщик конфигов / Dotfiles Installer

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🇷🇺 Начинаем установку конфигов..."
echo "🇬🇧 Starting dotfiles installation..."
echo "🇷🇺 Осторожно: Это заменит ваши текущие настройки!"
echo "🇬🇧 Warning: This will overwrite your current settings!"
sleep 2

# Функция для создания символических ссылок / Function to create symlinks
link_config() {
    local source_dir="$1"
    local target_dir="$2"
    
    if [ -d "$DOTFILES_DIR/$source_dir" ]; then
        echo "🇷🇺 Создаем ссылку / 🇬🇧 Creating link: $source_dir -> $target_dir"
        rm -rf "$target_dir/$source_dir" # Удаляем старое, если есть / Remove old if exists
        ln -sf "$DOTFILES_DIR/$source_dir" "$target_dir/$source_dir"
    fi
}

# Убедимся, что .config существует / Ensure .config exists
mkdir -p "$CONFIG_DIR"

# Линкуем основные папки / Linking main folders
link_config "hyprland" "$CONFIG_DIR"
link_config "waybar" "$CONFIG_DIR"
link_config "wofi" "$CONFIG_DIR"
link_config "wezterm" "$CONFIG_DIR"
link_config "nvim" "$CONFIG_DIR"
link_config "swaync" "$CONFIG_DIR"
link_config "hyprlock" "$CONFIG_DIR"
link_config "hypridle" "$CONFIG_DIR"
link_config "gtk-3.0" "$CONFIG_DIR"
link_config "gtk-4.0" "$CONFIG_DIR"
link_config "control-center" "$CONFIG_DIR"

# Dolphin (отдельный файл, не папка в .config по умолчанию / single file, not a folder in .config by default)
mkdir -p "$CONFIG_DIR/dolphin"
ln -sf "$DOTFILES_DIR/dolphin/dolphinrc" "$CONFIG_DIR/dolphin/dolphinrc"

# Скрипты / Scripts
mkdir -p "$HOME/.local/bin"
if [ -d "$DOTFILES_DIR/scripts" ]; then
    echo "🇷🇺 Копируем скрипты в ~/.local/bin... / 🇬🇧 Copying scripts to ~/.local/bin..."
    cp -rsf "$DOTFILES_DIR/scripts/"* "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/"*
fi

# Иконки / Icons
mkdir -p "$HOME/.local/share/icons"
if [ -d "$DOTFILES_DIR/icons" ]; then
    echo "🇷🇺 Копируем иконки... / 🇬🇧 Copying icons..."
    cp -rsf "$DOTFILES_DIR/icons" "$HOME/.local/share/icons/my-custom-icons"
fi

echo ""
echo "🇷🇺 Установка завершена! ✅"
echo "🇬🇧 Installation complete! ✅"
echo "🇷🇺 Пожалуйста, перезапустите сессию Hyprland, чтобы изменения вступили в силу."
echo "🇬🇧 Please restart your Hyprland session for changes to take effect."
