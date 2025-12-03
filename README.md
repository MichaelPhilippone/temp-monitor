# Raspberry Pi Temperature Monitor

Automated temperature monitoring script with email alerts for Raspberry Pi overheating protection.

## Purpose

This script monitors your Raspberry Pi's CPU temperature and sends email alerts when the temperature exceeds a safe threshold, helping prevent thermal damage and system instability.

## Features

- Real-time CPU temperature monitoring
- Configurable temperature threshold (default: 65°C)
- Automatic email alerts on high temperature
- Lightweight and efficient
- Can be scheduled via cron for continuous monitoring

## How It Works

The script:
1. Reads the current CPU temperature using `vcgencmd`
2. Compares it against the defined threshold
3. Sends an email alert if temperature exceeds the limit

## Usage

Manual check:
```bash
./temp_monitor.sh
```

### Automated Monitoring (Recommended)

Add to crontab for periodic checks:
```bash
# Check temperature every 5 minutes
*/5 * * * * /home/pi/Projects/temp-monitor/temp_monitor.sh
```

## Configuration

Edit the script to customize:
- **THRESHOLD**: Temperature limit in Celsius (default: 65°C)
- **Email address**: Notification recipient

## Alert Example

When triggered, you'll receive an email with:
- Current temperature reading
- Timestamp
- Hostname of the Raspberry Pi

## Temperature Guidelines

- **Normal**: < 60°C
- **Warm**: 60-70°C
- **Hot**: 70-80°C (Alert recommended)
- **Critical**: > 80°C (Immediate action needed)
