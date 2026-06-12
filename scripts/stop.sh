#!/usr/bin/env bash
set -euo pipefail

echo "==> Stopping and removing containers..."
docker compose down
echo "==> Application stopped successfully."
