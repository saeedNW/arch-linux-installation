#!/bin/bash

# ============================================
# MechSim Toggle Script with Dynamic Volume
# ============================================

# Configuration
CONFIG_FILE="$HOME/.cache/mechsim_volume"
SOUNDPACK="eg-crystal-purple"

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS] [VOLUME]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -s, --status   Show current MechSim status"
    echo "  -l, --list     List available soundpacks"
    echo ""
    echo "Volume:"
    echo "  Number between 0-100 (default: last used or 100)"
    echo ""
    echo "Examples:"
    echo "  $0              # Toggle on/off with last volume"
    echo "  $0 50           # Toggle on/off with 50% volume"
    echo "  $0 --status     # Check if MechSim is running"
}

# Function to check status
check_status() {
    if pgrep -x "mechsim" > /dev/null; then
        echo "✅ MechSim is RUNNING"
        if [ -f "$CONFIG_FILE" ]; then
            echo "   Last used volume: $(cat "$CONFIG_FILE")%"
        fi
    else
        echo "❌ MechSim is STOPPED"
    fi
}

# Function to list soundpacks
list_soundpacks() {
    echo "Available soundpacks:"
    echo "  eg-crystal-purple"
    echo "  eg-holy-panda"
    echo "  eg-cherry-mx-brown"
    echo "  eg-cherry-mx-blue"
    echo "  eg-cherry-mx-red"
    echo "  eg-topre"
    echo "  eg-box-jade"
    echo "  eg-aliaz"
    echo ""
    echo "Change soundpack by editing SOUNDPACK variable in this script"
}

# Parse arguments
case "$1" in
    -h|--help)
        show_usage
        exit 0
        ;;
    -s|--status)
        check_status
        exit 0
        ;;
    -l|--list)
        list_soundpacks
        exit 0
        ;;
esac

# Handle volume argument
if [ -n "$1" ] && [[ "$1" =~ ^[0-9]+$ ]]; then
    VOLUME="$1"
    if [ "$VOLUME" -lt 0 ] || [ "$VOLUME" -gt 100 ]; then
        echo "❌ Error: Volume must be between 0 and 100"
        exit 1
    fi
    echo "$VOLUME" > "$CONFIG_FILE"
    echo "📝 Volume set to $VOLUME% (saved for future)"
else
    if [ -f "$CONFIG_FILE" ]; then
        VOLUME=$(cat "$CONFIG_FILE")
    else
        VOLUME=100
    fi
fi

# Toggle logic
if pgrep -x "mechsim" > /dev/null; then
    sudo pkill mechsim
    echo "🔇 MechSim STOPPED"
else
    # Start MechSim with proper PulseAudio access
    sudo -b env \
        PULSE_RUNTIME_PATH="/run/user/$(id -u)/pulse" \
        PULSE_SERVER="unix:/run/user/$(id -u)/pulse/native" \
        XDG_RUNTIME_DIR="/run/user/$(id -u)" \
        mechsim -V "$VOLUME" -s "$SOUNDPACK"

    sleep 0.5
    if pgrep -x "mechsim" > /dev/null; then
        echo "🔊 MechSim STARTED"
        echo "   Volume: $VOLUME%"
        echo "   Soundpack: $SOUNDPACK"
        echo ""
        echo "💡 Tip: Run '$0 --status' to check status"
    else
        echo "❌ Failed to start MechSim"
        exit 1
    fi
fi
