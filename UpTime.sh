#!/bin/bash

URL="https://megahtex.com/thispagedoesntexist"
RESPONSE=$(curl -s --max-time 10 "$URL")
STATUS=$(echo "$RESPONSE" | wc -c)

# If page is empty or status code is not 200
if [[ "$STATUS" -eq 0 ]]; then
  MESSAGE="⚠️ Website issue: Blank page detected\nURL: $URL"
  curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
    -d chat_id="${TELEGRAM_CHAT_ID}" \
    -d text="$MESSAGE"
else
  # Optional: send a success message
  echo "✅ Page loaded successfully, size: $STATUS bytes"
fi
