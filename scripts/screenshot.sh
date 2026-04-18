#!/bin/bash
# Скрипт для скриншотов (требует grim и slurp) / Screenshot script (requires grim and slurp)

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="$SAVE_DIR/screenshot_$(date +'%Y%m%d_%H%M%S').png"

# Выбор области и создание скриншота / Select area and take screenshot
grim -g "$(slurp)" "$FILENAME"

# Отправка уведомления / Send notification
# Локализация уведомления в зависимости от переменной LANG (опционально), но здесь покажем просто двуязычное
notify-send "📸 Скриншот сохранен / Screenshot saved" "$FILENAME" -i "$FILENAME"
