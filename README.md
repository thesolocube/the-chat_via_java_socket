# SocketProject - Chat Java / JavaFX

## Lancer le serveur (console)
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
```
Le serveur affiche les adresses IP où se connecter (port par défaut 55555).

## Lancer le client GUI (chat.fxml)
```powershell
mvn javafx:run
```
ou
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.ChatApplication"
```

Variables optionnelles :
- `-Dchat.host=192.168.1.10` pour pointer vers un autre serveur que localhost
- `-Dchat.port=55555` pour changer le port

## Lancer le client console (optionnel)
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
```

## Scripts Windows
- `start-server.bat` : démarre le serveur
- `start-client.bat` : démarre le client console

## Pré-requis
- Java 11+
- Maven 3.6+




