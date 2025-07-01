#!/bin/bash
set -e

echo "🧵 Installing Bun..."
curl -fsSL https://bun.sh/install | bash

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

echo "📦 Installing dependencies with Bun..."
bun install

echo "🔨 Running build script with Bun..."
bun run build#!/bin/bash
set -e

echo "🧵 Installing Bun..."
curl -fsSL https://bun.sh/install | bash

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

echo "📦 Installing dependencies with Bun..."
bun install

echo "🔨 Running build script with Bun..."
bun run build


