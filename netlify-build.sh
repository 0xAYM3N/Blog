#!/bin/bash
set -e

echo "📦 Installing Bun..."
curl -fsSL https://bun.sh/install | bash

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

echo "📦 Installing dependencies with Bun..."
bun install

echo "🚀 Building project with Bun..."
bun run build

