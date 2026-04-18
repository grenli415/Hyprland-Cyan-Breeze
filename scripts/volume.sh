#!/bin/bash
# Скрипт для управления звуком (через WirePlumber / PipeWire) 
# Volume control script (via WirePlumber / PipeWire)

case "$1" in
    up)
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *)
        echo "Использование / Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

# Отправка уведомления с текущей громкостью / Send notification with current volume
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
notify-send -t 1000 -h string:x-canonical-private-synchronous:sys-notify -u normal "🔊 Громкость / Volume: ${VOL}%"
