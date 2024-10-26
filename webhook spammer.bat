@echo off
title Discord Webhook Sender
color 0a

REM Ask for Discord Webhook URL
set /p WEBHOOK_URL="Enter your Discord Webhook URL: "

REM Ask for the message to send
set /p MESSAGE="Enter the message to send: "

REM Ask for delay between messages (in seconds)
set /p DELAY="Enter delay between messages (in seconds): "

REM Ask for the number of messages to send
set /p COUNT="Enter the number of times to send the message: "

:send_loop
cls
echo ===========================================================
echo                Sending Messages to Discord
echo ===========================================================
echo Webhook URL: %WEBHOOK_URL%
echo Message: %MESSAGE%
echo Delay: %DELAY% seconds
echo Count: %COUNT%
echo ===========================================================

REM Loop to send the message COUNT times
for /L %%i in (1,1,%COUNT%) do (
    echo Sending message %%i of %COUNT%...
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%MESSAGE%\"}" %WEBHOOK_URL%
    timeout /t %DELAY% >nul
)

echo ===========================================================
echo              Messages sent successfully!
echo ===========================================================
pause
