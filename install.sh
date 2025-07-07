#!/bin/bash

# Claude Code Global Settings Installation Script

# Exit on error
set -e

# Define the Claude Code settings directory
CLAUDE_SETTINGS_DIR="$HOME/.config/claude-code"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Installing Claude Code global settings..."

# Create the settings directory if it doesn't exist
if [ ! -d "$CLAUDE_SETTINGS_DIR" ]; then
    echo -e "${YELLOW}Creating Claude Code settings directory...${NC}"
    mkdir -p "$CLAUDE_SETTINGS_DIR"
fi

# Create slash-commands directory if it doesn't exist
if [ ! -d "$CLAUDE_SETTINGS_DIR/slash-commands" ]; then
    echo -e "${YELLOW}Creating slash-commands directory...${NC}"
    mkdir -p "$CLAUDE_SETTINGS_DIR/slash-commands"
fi

# Copy slash commands
echo -e "${GREEN}Copying slash commands...${NC}"
if [ -d "slash-commands" ]; then
    cp -r slash-commands/* "$CLAUDE_SETTINGS_DIR/slash-commands/"
    echo -e "${GREEN}✓ Slash commands copied successfully${NC}"
else
    echo -e "${RED}✗ slash-commands directory not found${NC}"
    exit 1
fi

# Copy CLAUDE.md
echo -e "${GREEN}Copying CLAUDE.md...${NC}"
if [ -f "claudemd/CLAUDE.md" ]; then
    cp claudemd/CLAUDE.md "$CLAUDE_SETTINGS_DIR/CLAUDE.md"
    echo -e "${GREEN}✓ CLAUDE.md copied successfully${NC}"
else
    echo -e "${RED}✗ claudemd/CLAUDE.md not found${NC}"
    exit 1
fi

echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "Files installed to: ${YELLOW}$CLAUDE_SETTINGS_DIR${NC}"
echo -e "\nInstalled files:"
echo -e "  - CLAUDE.md"
echo -e "  - slash-commands/"
ls -la "$CLAUDE_SETTINGS_DIR/slash-commands/" | grep -v "^total" | grep -v "^d" | awk '{print "    - " $9}'