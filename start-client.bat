@echo off
echo ========================================
echo   Demarrage du Client de Chat
echo ========================================
echo.
mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
pause


