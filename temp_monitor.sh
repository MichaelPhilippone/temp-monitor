#!/bin/bash

# Temperature threshold in Celsius
THRESHOLD=65

# Get current temperature
TEMP_OUTPUT=$(vcgencmd measure_temp)
TEMP=$(echo "$TEMP_OUTPUT" | grep -o '[0-9.]*' | head -1)

# Compare temperature (using bc for floating point comparison)
if (( $(echo "$TEMP > $THRESHOLD" | bc -l) )); then
    # Send email alert
    SUBJECT="Temperature Alert: ${TEMP}°C"
    MESSAGE="Warning: Raspberry Pi temperature has exceeded ${THRESHOLD}°C
    
Current temperature: ${TEMP}°C
Time: $(date)
Hostname: $(hostname)"
    
    echo "$MESSAGE" | mail -s "$SUBJECT" "michael.philippone@gmail.com"
fi
