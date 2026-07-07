#!/usr/bin/env bash

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="$SAVE_DIR/Screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"

show_help() {
    echo "Usage: $0 [option]"
    echo "Options:"
    echo "  full"
    echo "  area"
    exit 1
}

if [ -z "$1" ]; then
    show_help
fi

case "$1" in
    full)
        grim - | tee >(wl-copy) > "$FILENAME"
        swappy -f "$FILENAME" -o "$FILENAME"
        notify-send "Full Screenshot" "Saved to $SAVE_DIR" -t 2000
        ;;
        
    area)

        if command -v hyprpicker &> /dev/null; then
            hyprpicker -r -z &
            PICKER_PID=$!
            sleep 0.1 # Give Hyprpicker time to freeze the screen
        fi

        AREA=$(slurp -b '#000000b0' -c '#00000000')
        SLURP_EXIT_CODE=$?

        if [ -n "$PICKER_PID" ]; then
            kill "$PICKER_PID" &> /dev/null
        fi

        if [ $SLURP_EXIT_CODE -ne 0 ]; then
            exit 0
        fi

        grim -g "$AREA" - | tee >(wl-copy) > "$FILENAME"
        swappy -f "$FILENAME" -o "$FILENAME"
        notify-send "Area Screenshot" "Saved to $SAVE_DIR" -t 2000
        ;;
        
    *)
        show_help
        ;;
esac
