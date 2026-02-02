#!/bin/bash

# URL="https://megahtex.com/thispagedoesntexist"
# RESPONSE=$(curl -s --max-time 10 "$URL")
# STATUS=$(echo "$RESPONSE" | wc -c)

# # If page is empty or status code is not 200
# if [[ "$STATUS" -eq 0 ]]; then
#   MESSAGE="⚠️ Website issue: Blank page detected\nURL: $URL"
#   curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
#     -d chat_id="${TELEGRAM_CHAT_ID}" \
#     -d text="$MESSAGE"
# else
#   # Optional: send a success message
#   echo "✅ Page loaded successfully, size: $STATUS bytes"
# fi

set -x  # print commands as they run
set -o errexit  # exit on error
set -o pipefail  # catch errors in pipes
set -o nounset  # catch unset variables

echo "TELEGRAM_TOKEN length: ${#TELEGRAM_TOKEN}"
echo "TELEGRAM_CHAT_ID: $TELEGRAM_CHAT_ID"

URL="https://megahtex.com/"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL") || STATUS="000"
echo "HTTP status: $STATUS"

MESSAGE="Website status check%0AURL: $URL%0AStatus code: $STATUS"
echo "Sending message: $MESSAGE"

RESPONSE=$(curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
  -d chat_id="$TELEGRAM_CHAT_ID" \
  -d text="$MESSAGE" \
  -w "\nHTTP_CODE:%{http_code}\n") || RESPONSE="Telegram request failed"

echo "Telegram response: $RESPONSE"

