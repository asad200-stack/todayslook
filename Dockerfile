# Use Node.js LTS version
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./
COPY client/package*.json ./client/

# Install root dependencies (production only for server)
RUN npm ci --omit=dev

# Install client dependencies (including dev dependencies needed for build)
WORKDIR /app/client
RUN npm ci

# Copy all remaining files
WORKDIR /app
COPY . .

# Build client application
WORKDIR /app/client
RUN npm run build

# Return to root directory
WORKDIR /app

# Expose port
EXPOSE 3000

# Start server
CMD ["npm", "start"]

