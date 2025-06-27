# 🚀 Snabbstart - Inköpsplanerare Docker

## Steg 1: Skapa projektmapp
```bash
mkdir purchase-planner && cd purchase-planner
```

## Steg 2: Skapa alla filer

Skapa följande struktur:
```
purchase-planner/
├── Dockerfile
├── docker-compose.yml
├── nginx.conf
├── package.json
├── .dockerignore
├── build.sh
├── public/
│   └── index.html
└── src/
    ├── index.js
    ├── index.css
    ├── App.js
    ├── App.css
    └── components/
        └── PurchasePlanner.js
```

## Steg 3: Kopiera innehåll

1. **PurchasePlanner.js**: Kopiera koden från "Källkod - Inköpsplanerare för E-handel"
2. **Övriga filer**: Kopiera från respektive artifacts ovan

## Steg 4: Gör build-scriptet körbart
```bash
chmod +x build.sh
```

## Steg 5: Kör byggscriptet
```bash
./build.sh
```

## Steg 6: Öppna appen
Gå till http://localhost:8080

---

## 🛠️ Manuell setup (utan script)

```bash
# Bygga och starta
docker-compose up -d --build

# Kontrollera status
docker ps

# Se loggar
docker-compose logs -f
```

## ⚡ Snabbkommandon

**Starta:**
```bash
docker-compose up -d
```

**Stoppa:**
```bash
docker-compose down
```

**Rebuild efter ändringar:**
```bash
docker-compose up -d --build
```

**Se loggar:**
```bash
docker-compose logs -f
```

## 🔧 Ändra port

Redigera `docker-compose.yml`:
```yaml
ports:
  - "3000:80"  # Byt 8080 till 3000
```

## ❓ Problem?

1. **Port upptagen?**
   ```bash
   # Linux/Mac
   lsof -i :8080
   # Windows
   netstat -ano | findstr :8080
   ```

2. **Permission denied?**
   ```bash
   sudo docker-compose up -d --build
   ```

3. **Cache-problem?**
   ```bash
   docker-compose build --no-cache
   docker-compose up -d
   ```
