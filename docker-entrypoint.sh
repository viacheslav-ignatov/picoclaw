#!/bin/sh
set -e

mkdir -p /home/picoclaw/.picoclaw

cat > /home/picoclaw/.picoclaw/config.json << EOF
{
  "agents": {
    "defaults": {
      "workspace": "~/.picoclaw/workspace",
      "model": "${PICOCLAW_MODEL}",
      "max_tokens": 8192
    }
  },
  "providers": {
    "openrouter": {
      "api_key": "${OPENROUTER_API_KEY}",
      "base_url": "https://openrouter.ai/api/v1"
    }
  },
  "channels": {
    "telegram": {
      "enabled": true,
      "token": "${TELEGRAM_TOKEN}",
      "allowFrom": ["${TELEGRAM_USER_ID}"]
    }
  }
}
EOF

exec "$@"