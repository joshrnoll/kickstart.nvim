#!/bin/bash

if ! command -v sops &> /dev/null; then
  echo "SOPS is not installed. Exiting..."
fi 

read -sp "Enter Claude Code key: " CLAUDE_KEY
echo ""
read -sp "Enter OpenRouter API key: " OPENROUTER_KEY

mkdir -p keys

echo $CLAUDE_KEY > keys/claude.txt
echo $OPENROUTER_KEY > keys/openrouter.txt

sops -e --age age18dvn87z8hq2e0kak3f5d06xn9ynpcmfkkvep4ch8z32m7hkma3xsmgez3x keys/claude.txt > keys/claude.enc.txt && rm keys/claude.txt
sops -e --age age18dvn87z8hq2e0kak3f5d06xn9ynpcmfkkvep4ch8z32m7hkma3xsmgez3x keys/openrouter.txt > keys/openrouter.enc.txt && rm keys/openrouter.txt


