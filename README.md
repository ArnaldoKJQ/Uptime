# Web-Status-Github

Python-based uptime monitoring tool designed to run as a **GitHub Action**. It periodically pings URLs and sends status alerts via **Telegram**.

## ⚙️ Technical Specs
* **Runtime:** GitHub Actions (`ubuntu-latest`)
* **Language:** Python 3.10+
* **Communication:** Telegram Bot API
* **Trigger:** `cron` schedule + `workflow_dispatch`

## 🛠 Configuration (Secrets)
Do not store credentials in the script. Use **Settings > Secrets and variables > Actions** in your repo to add:

| Secret | Description |
| :--- | :--- |
| `TELEGRAM_TOKEN` | API token from @BotFather |
| `CHAT_ID` | Telegram Chat ID |

## ⚠️ Known Issue: GitHub Cron Inconsistency
Running monitors on GitHub Actions has a specific disadvantage regarding timing:
* **Latency:** The `schedule` event is "best-effort." A job set for every 15 minutes (`*/15 * * * *`) often executes with a **5 to 30 minute delay**.
* **Variable Intervals:** Because GitHub scales based on global load, intervals between checks are not consistent.
* **Skipped Runs:** During high platform traffic, scheduled runs can be skipped entirely.
* **Usage Case:** Suitable for general uptime tracking, but **not** for high-precision or mission-critical alerting.

## 🚀 Setup
1. **Define Targets:** Add your URL to `UpTime.sh`.
3. **Deploy:** The workflow in `.github/workflows/` will trigger automatically.
