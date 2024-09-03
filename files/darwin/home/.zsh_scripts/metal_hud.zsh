#!/usr/bin/env zsh

# Function to handle Metal HUD
metal_hud_function() {
    case "$1" in
        on)
            /bin/launchctl setenv MTL_HUD_ENABLED 1
            echo "Metal HUD enabled"
            ;;
        off)
            /bin/launchctl unsetenv MTL_HUD_ENABLED
            echo "Metal HUD disabled"
            ;;
        status)
            hud_status=$(/bin/launchctl getenv MTL_HUD_ENABLED)
            if [[ -z "$hud_status" ]]; then
                echo "Metal HUD is currently disabled"
            else
                echo "Metal HUD is currently enabled"
            fi
            ;;
        help)
            echo "Usage:"
            echo "  metal_hud on     - Enable Metal HUD"
            echo "  metal_hud off    - Disable Metal HUD"
            echo "  metal_hud status - Check Metal HUD status"
            echo "  metal_hud help   - Display this help message"
            ;;
        *)
            echo "Unknown command. Use 'metal_hud help' for usage information."
            ;;
    esac
}

# Set up the alias
alias metal_hud='metal_hud_function'

# Execute the function only if this script is run directly, not when sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" || "$ZSH_EVAL_CONTEXT" == 'toplevel' ]]; then
    metal_hud_function "$@"
fi
