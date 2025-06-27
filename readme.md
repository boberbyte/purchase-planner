# Inköpsplanerare för E-handel - Docker Setup


## 🚀 Snabbstart

### 1. Skapa projektmappen och filer

```bash
# Skapa projektstruktur
mkdir -p purchase-planner/src/components purchase-planner/public
cd purchase-planner

# Kopiera alla filer från artifakterna till rätt platser
```

### 2. Skapa CSS-filer

**src/index.css:**
```css
body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}
```

**src/App.css:**
```css
.App {
  min-height: 100vh;
  background-color: #f3f4f6;
}
```

### 3. Flytta komponenten

Kopiera hela innehållet från "Källkod - Inköpsplanerare för E-handel" till:
`src/components/PurchasePlanner.js`

## 🐳 Docker-kommandon

### Bygga och köra med Docker Compose (Rekommenderat)

```bash
# Bygga och starta
docker-compose up -d --build

# Stoppa
docker-compose down

# Se loggar
docker-compose logs -f
```

### Eller bygga manuellt

```bash
# Bygga imagen
docker build -t purchase-planner .

# Köra containern
docker run -d -p 8080:80 --name purchase-planner purchase-planner

# Stoppa containern
docker stop purchase-planner

# Ta bort containern
docker rm purchase-planner
```

## 🌐 Åtkomst

Efter start, öppna webbläsaren och gå till:
```
http://localhost:8080
```

## 🔧 Konfiguration

### Ändra port
Redigera `docker-compose.yml`:
```yaml
ports:
  - "3000:80"  # Ändra 3000 till önskad port
```

### Miljövariabler
Lägg till i `docker-compose.yml`:
```yaml
environment:
  - REACT_APP_API_URL=https://api.example.com
  - REACT_APP_VERSION=1.0.0
```

## 🛠️ Utveckling

För lokal utveckling utan Docker:

```bash
# Installera dependencies
npm install

# Starta utvecklingsserver
npm start

# Bygga för produktion
npm run build
```

## 📦 Optimeringar

Docker-imagen använder:
- **Multi-stage build** - Mindre slutgiltig image (~25MB)
- **Nginx Alpine** - Lättviktig webbserver
- **Gzip-komprimering** - Snabbare laddning
- **Cache-headers** - Bättre prestanda

## 🐛 Felsökning

### Problem: "Cannot find module"
```bash
# Rensa Docker cache och bygg om
docker-compose build --no-cache
```

### Problem: "Port already in use"
```bash
# Hitta process som använder porten
lsof -i :8080  # På Mac/Linux
netstat -ano | findstr :8080  # På Windows

# Eller byt port i docker-compose.yml
```

### Se Docker loggar
```bash
docker logs purchase-planner
```

## 🔒 Säkerhet

- Nginx konfigurerad med säkerhetsheaders
- Endast nödvändiga filer kopieras till imagen
- Kör som non-root user i produktion (kan läggas till)

## 📝 Licens

Detta projekt är skapat för intern användning.
