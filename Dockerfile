# Multi-stage build för optimerad image-storlek

# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Kopiera package filer
COPY package*.json ./

# Installera dependencies
RUN npm install --only=production

# Kopiera källkod
COPY . .

# Bygg appen
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

# Kopiera byggd app från builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Kopiera nginx konfiguration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponera port 80
EXPOSE 80

# Starta nginx
CMD ["nginx", "-g", "daemon off;"]