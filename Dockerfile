# Use Node.js LTS version
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy all files first (including client directory)
COPY . .

# Install all dependencies and build
RUN npm run install-all && npm run build

# Expose port
EXPOSE 3000

# Start server
CMD ["npm", "start"]

