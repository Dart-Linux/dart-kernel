set -e

# Get the directory where the autobuild.sh script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Define the configuration file name
CONFIG_FILE="$SCRIPT_DIR/config"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Copy the configuration file to the current working directory
echo "[*] Copying config..."
cp "$CONFIG_FILE" .config

CRULE=$(dialog --stdout --backtitle "Dart Kernel Auto-Builder" --title "Makefile Rules" --radiolist "Choose build steps" 10 0 0 \
        all "Build everything (much build time)" on \
        bzImage "Build bzImage (less build time)" off \
        modules "Build modules (for recovery)" off \
        vmlinux "Build ELF image (same as bzImage, for debugging purposes)" off )

clear
if [ "$?" -ne 0 ]; then
    echo "Aborted build."
    exit 1
fi

echo "[*] Parallel building..."
echo "[*] make $CRULE -j$(nproc)"
time make $CRULE -j$(nproc)
