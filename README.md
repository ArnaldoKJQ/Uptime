# 🌐 Web-Status-Telegram

A lightweight bash monitoring tool that tracks the availability of your websites and sends instant status updates to a Telegram bot.

---

## 🚀 Overview
**Web-Status-Telegram** is designed for developers and sysadmins who need a simple, no-frills way to monitor uptime. It pings a list of URLs and alerts you immediately if a service becomes unreachable or returns an error code.

## ✨ Key Features
* **Automated Monitoring:** Periodic HTTP health checks for multiple URLs.
* **Instant Notifications:** Real-time alerts via Telegram Bot API.
* **Status Tracking:** Reports both "Down" events and "Recovery" (Up) events.
* **Minimalist Design:** Easy to deploy on a VPS, Raspberry Pi, or local machine.

## 🛠️ Requirements
* A Telegram Bot Token (from [@BotFather](https://t.me/botfather))

### ⚠️ Limitations: GitHub Actions Scheduling
This tool runs via a **GitHub Actions YAML workflow**, please keep the following in mind:

* **Inconsistent Intervals:** The GitHub Actions `schedule` event is a "best-effort" service. Even if you set it to run every 15 minutes (`*/15 * * * *`), execution can be delayed significantly based on GitHub's current server load.
* **Execution Delays:** It is common for scheduled tasks to be delayed by **5 to 20 minutes** beyond the requested time. In some cases, if the queue is highly congested, a scheduled run might be skipped entirely.
* **Not for Mission-Critical Monitoring:** Because of these unpredictable delays, this repository is excellent for general status tracking but should not be relied upon for mission-critical services that require precise, high-frequency alerts.

> **Tip:** For a guaranteed 15-minute interval, it is recommended to host the script on a **VPS**
