#!/bin/bash

if ! command -v sops &> /dev/null; then
  echo "SOPS is not installed. Exiting..."
  exit 1
fi

AGE_KEY="age18dvn87z8hq2e0kak3f5d06xn9ynpcmfkkvep4ch8z32m7hkma3xsmgez3x"

mkdir -p keys

read -p "Generate Claude Code key? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  read -sp "Enter Claude Code key: " KEY
  echo ""
  echo "$KEY" > keys/claude.txt
  sops -e --age "$AGE_KEY" keys/claude.txt > keys/claude.enc.txt && rm keys/claude.txt
fi

read -p "Generate Anthropic key? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  read -sp "Enter Anthropic key: " KEY
  echo ""
  echo "$KEY" > keys/anthropic.txt
  sops -e --age "$AGE_KEY" keys/anthropic.txt > keys/anthropic.enc.txt && rm keys/anthropic.txt
fi

read -p "Generate OpenAI key? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  read -sp "Enter OpenAI key: " KEY
  echo ""
  echo "$KEY" > keys/openai.txt
  sops -e --age "$AGE_KEY" keys/openai.txt > keys/openai.enc.txt && rm keys/openai.txt
fi

read -p "Generate OpenRouter key? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  read -sp "Enter OpenRouter key: " KEY
  echo ""
  echo "$KEY" > keys/openrouter.txt
  sops -e --age "$AGE_KEY" keys/openrouter.txt > keys/openrouter.enc.txt && rm keys/openrouter.txt
fi
