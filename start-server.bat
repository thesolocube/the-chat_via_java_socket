@echo off
echo ========================================
echo   Demarrage du Serveur de Chat
echo ========================================
echo.
mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
pause


