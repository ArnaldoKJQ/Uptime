#!/bin/bash

URL="https://megahtex.com/p"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

if [[ "$STATUS" != "200" ]]; then
  MESSAGE="⚠️ Website issue\nURL: $URL\nStatus: $STATUS"

  curl -s -X POST "https://api.telegram.org/bot8365333559:AAH7oCneaw61NSFHp-jVBnIW0QX8pHTgq-M/sendMessage" \
    -d chat_id="8528165371" \
    -d text="Check MegahTex Ecomm"
fi
