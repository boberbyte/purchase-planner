#!/bin/bash

# Färger för output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Startar byggprocess för Inköpsplanerare...${NC}"

# Kontrollera att Docker är installerat
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker är inte installerat! Installera Docker först.${NC}"
    exit 1
fi

# Skapa mappstruktur
echo -e "${YELLOW}📁 Skapar mappstruktur...${NC}"
mkdir -p src/components public

# Påminnelse om filer
echo -e "${YELLOW}📝 Kontrollera att följande filer finns:${NC}"
echo "   - Dockerfile"
echo "   - docker-compose.yml"
echo "   - nginx.conf"
echo "   - package.json"
echo "   - .dockerignore"
echo "   - public/index.html"
echo "   - src/index.js"
echo "   - src/App.js"
echo "   - src/components/PurchasePlanner.js"
echo "   - src/index.css"
echo "   - src/App.css"

read -p "Är alla filer på plats? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}❌ Avbryter. Lägg till alla filer först.${NC}"
    exit 1
fi

# Stoppa befintlig container om den körs
echo -e "${YELLOW}🛑 Stoppar befintlig container om den finns...${NC}"
docker-compose down 2>/dev/null

# Bygga och starta
echo -e "${GREEN}🔨 Bygger Docker image...${NC}"
docker-compose build

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Build lyckades!${NC}"
    
    echo -e "${GREEN}🚀 Startar applikationen...${NC}"
    docker-compose up -d
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Applikationen körs nu!${NC}"
        echo -e "${GREEN}🌐 Öppna http://localhost:8080 i din webbläsare${NC}"
        echo
        echo -e "${YELLOW}Användbara kommandon:${NC}"
        echo "  docker-compose logs -f     # Se loggar"
        echo "  docker-compose down        # Stoppa applikationen"
        echo "  docker-compose restart     # Starta om applikationen"
    else
        echo -e "${RED}❌ Kunde inte starta applikationen${NC}"
        exit 1
    fi
else
    echo -e "${RED}❌ Build misslyckades${NC}"
    exit 1
fi
