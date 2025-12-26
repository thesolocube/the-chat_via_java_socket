# SocketProject - Application de Chat en Java

Application de chat en temps réel utilisant les sockets Java. Le projet comprend un serveur de chat multi-clients et des clients console pour se connecter et communiquer.

## 📋 Prérequis

- **Java JDK 11** ou supérieur
- **Maven 3.6+** installé et configuré
- **Windows** (les commandes sont adaptées pour PowerShell/cmd)

### Vérifier l'installation

```powershell
java -version
mvn -version
```

## 🚀 Compilation du projet

Pour compiler le projet, exécutez la commande suivante dans le répertoire du projet :

```powershell
mvn clean compile
```

Cette commande va :
- Nettoyer les anciens fichiers compilés
- Compiler toutes les classes Java
- Télécharger les dépendances nécessaires (JavaFX, JUnit)

## 🖥️ Lancement du serveur

### Option 0 : Script batch (le plus simple sur Windows)

Double-cliquez sur `start-server.bat` ou exécutez :
```powershell
.\start-server.bat
```

### Option 1 : Avec Maven (recommandé)

```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
```

### Option 2 : Avec Java directement

Après compilation, utilisez :

```powershell
mvn package
java -cp "target/classes;target/dependency/*" org.example.socketproject.server.ServerMain
```

### Option 3 : Spécifier un port personnalisé

```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain" -Dexec.args="12345"
```

**Par défaut**, le serveur écoute sur le **port 55555**.

Une fois démarré, vous verrez :
```
🚀 Démarrage du serveur de chat sur le port 55555
✅ Serveur démarré sur le port 55555
⏳ En attente de connexions...
```

## 👤 Lancement d'un client

### Option 0 : Script batch (le plus simple sur Windows)

Double-cliquez sur `start-client.bat` ou exécutez :
```powershell
.\start-client.bat
```

### Option 1 : Avec Maven (recommandé)

Ouvrez une **nouvelle fenêtre de terminal** et exécutez :

```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
```

### Option 2 : Avec Java directement

```powershell
java -cp "target/classes;target/dependency/*" org.example.socketproject.client.ClientMain
```

### Instructions d'utilisation du client

1. **Adresse du serveur** : 
   - Appuyez sur `Entrée` pour utiliser `localhost` (si le serveur est sur la même machine)
   - Ou entrez l'adresse IP du serveur (ex: `192.168.1.100`)

2. **Port du serveur** :
   - Appuyez sur `Entrée` pour utiliser le port par défaut `55555`
   - Ou entrez un port personnalisé

3. **Nom d'utilisateur** :
   - Entrez votre pseudo pour le chat

4. **Envoyer des messages** :
   - Tapez votre message et appuyez sur `Entrée`
   - Tous les autres clients connectés recevront votre message

5. **Quitter** :
   - Tapez `/quit` pour vous déconnecter proprement

## 🌐 Chat sur le réseau local (entre plusieurs PC)

**Oui, le projet permet de chatter avec d'autres PC présents sur le même réseau !** 

### Configuration pour le réseau local

#### Sur le PC serveur :

1. **Lancez le serveur** :
   ```powershell
   mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
   ```

2. **Notez l'adresse IP affichée** :
   Le serveur affiche automatiquement les adresses IP disponibles, par exemple :
   ```
   ✅ Serveur démarré sur le port 55555
   🌐 Adresses IP disponibles pour la connexion :
      - localhost / 127.0.0.1 (même machine)
      - 192.168.1.100 (réseau local)
   ⏳ En attente de connexions...
   ```
   **Notez l'adresse IP du réseau local** (ex: `192.168.1.100`)

3. **Vérifiez le pare-feu Windows** :
   - Le pare-feu peut bloquer les connexions entrantes
   - Autorisez Java ou le port 55555 dans le pare-feu Windows si nécessaire

#### Sur les PC clients :

1. **Lancez le client** :
   ```powershell
   mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
   ```

2. **Entrez l'adresse IP du serveur** :
   - Quand le client demande "Entrez l'adresse du serveur", entrez l'**adresse IP du PC serveur** (ex: `192.168.1.100`)
   - **Ne laissez pas vide** (sinon il utilisera localhost)

3. **Entrez le port** :
   - Appuyez sur `Entrée` pour utiliser le port par défaut `55555`
   - Ou entrez le port personnalisé si le serveur utilise un autre port

4. **Entrez votre pseudo** et commencez à chatter !

### Exemple pratique

**PC 1 (Serveur - IP: 192.168.1.100)** :
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
```

**PC 2 (Client)** :
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
```
- Adresse serveur : `192.168.1.100`
- Port : `55555` (ou Entrée)
- Pseudo : `Alice`

**PC 3 (Client)** :
```powershell
mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
```
- Adresse serveur : `192.168.1.100`
- Port : `55555` (ou Entrée)
- Pseudo : `Bob`

Tous les messages seront partagés entre tous les clients connectés, peu importe sur quel PC ils se trouvent !

### Trouver l'adresse IP de votre PC (Windows)

Si vous ne connaissez pas l'adresse IP de votre PC :

```powershell
ipconfig
```

Cherchez la ligne **"Adresse IPv4"** sous votre carte réseau active (Wi-Fi ou Ethernet). Elle ressemble à `192.168.x.x` ou `10.x.x.x`.

### Dépannage réseau

- **"Connection refused"** : Vérifiez que le serveur est bien démarré et que l'adresse IP est correcte
- **"Connection timeout"** : Vérifiez le pare-feu Windows et que les PC sont sur le même réseau
- **Impossible de se connecter** : Vérifiez que le port 55555 n'est pas bloqué par le pare-feu

## 🧪 Test du projet

### Test basique (1 serveur + 2 clients)

**Méthode rapide avec scripts batch :**

1. **Double-cliquez sur `start-server.bat`** (Terminal 1 - Serveur)

2. **Double-cliquez sur `start-client.bat`** (Terminal 2 - Client 1)
   - Adresse : `Entrée` (localhost)
   - Port : `Entrée` (55555)
   - Pseudo : `Alice`

3. **Double-cliquez sur `start-client.bat`** (Terminal 3 - Client 2)
   - Adresse : `Entrée` (localhost)
   - Port : `Entrée` (55555)
   - Pseudo : `Bob`

**Ou avec Maven :**

1. **Terminal 1 - Serveur** :
   ```powershell
   mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain"
   ```

2. **Terminal 2 - Client 1** :
   ```powershell
   mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
   ```
   - Adresse : `Entrée` (localhost)
   - Port : `Entrée` (55555)
   - Pseudo : `Alice`

3. **Terminal 3 - Client 2** :
   ```powershell
   mvn exec:java -Dexec.mainClass="org.example.socketproject.client.ClientMain"
   ```
   - Adresse : `Entrée` (localhost)
   - Port : `Entrée` (55555)
   - Pseudo : `Bob`

4. **Test de communication** :
   - Dans le terminal de `Alice`, tapez : `Bonjour Bob !`
   - `Bob` devrait recevoir le message : `Alice: Bonjour Bob !`
   - Dans le terminal de `Bob`, tapez : `Salut Alice !`
   - `Alice` devrait recevoir le message : `Bob: Salut Alice !`

### Test multi-clients

Vous pouvez lancer plusieurs clients simultanément. Tous les messages seront diffusés à tous les clients connectés (sauf l'expéditeur).

### Test de déconnexion

- Tapez `/quit` dans un client
- Les autres clients recevront un message indiquant que vous avez quitté le chat
- Le serveur affichera la déconnexion dans ses logs

## 📁 Structure du projet

```
SocketProject/
├── src/
│   └── main/
│       ├── java/
│       │   └── org/example/socketproject/
│       │       ├── client/
│       │       │   ├── ChatClient.java      # Client de chat console
│       │       │   ├── ClientListener.java  # Thread d'écoute des messages
│       │       │   └── ClientMain.java      # Point d'entrée du client
│       │       ├── server/
│       │       │   ├── ChatServer.java      # Serveur de chat
│       │       │   ├── ClientHandler.java   # Gestionnaire de client
│       │       │   └── ServerMain.java      # Point d'entrée du serveur
│       │       ├── HelloApplication.java    # Application JavaFX (exemple)
│       │       ├── HelloController.java     # Contrôleur JavaFX (exemple)
│       │       └── Launcher.java            # Lanceur JavaFX (exemple)
│       └── resources/
│           └── org/example/socketproject/
│               └── hello-view.fxml          # Interface FXML (exemple)
├── pom.xml                                   # Configuration Maven
└── README.md                                 # Ce fichier
```

## 🔧 Commandes utiles

### Compiler uniquement
```powershell
mvn compile
```

### Nettoyer et compiler
```powershell
mvn clean compile
```

### Créer un JAR exécutable
```powershell
mvn clean package
```

### Exécuter les tests
```powershell
mvn test
```

### Voir les dépendances
```powershell
mvn dependency:tree
```

## ⚠️ Dépannage

### Erreur : "Port déjà utilisé"
- Le port 55555 est peut-être déjà utilisé par un autre processus
- Changez le port avec : `mvn exec:java -Dexec.mainClass="org.example.socketproject.server.ServerMain" -Dexec.args="12345"`
- Ou arrêtez le processus qui utilise le port

### Erreur : "Connection refused"
- Vérifiez que le serveur est bien démarré
- Vérifiez que l'adresse IP et le port sont corrects
- Vérifiez les règles de pare-feu Windows

### Erreur de compilation JavaFX
- Assurez-vous d'avoir Java 11 ou supérieur
- Vérifiez que Maven a bien téléchargé les dépendances : `mvn dependency:resolve`

### Erreur : "ClassNotFoundException"
- Recompilez le projet : `mvn clean compile`
- Vérifiez que vous utilisez le bon chemin de classe dans la commande Java

## 📝 Notes

- Le serveur peut gérer plusieurs clients simultanément grâce à un pool de threads
- Les messages sont diffusés à tous les clients sauf l'expéditeur
- La commande `/quit` permet de se déconnecter proprement
- Le serveur affiche des logs détaillés des connexions/déconnexions et des messages

## 🎯 Fonctionnalités

- ✅ Serveur multi-clients avec thread pool
- ✅ Clients console interactifs
- ✅ Diffusion de messages en temps réel
- ✅ Gestion des déconnexions
- ✅ Commandes spéciales (`/quit`)
- ✅ Gestion d'erreurs robuste
- ✅ Logs détaillés côté serveur

## 📄 Licence

Ce projet est fourni à des fins éducatives.

