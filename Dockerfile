#---------------------------STAGE 1-----------------------------------------------

# Use official Node.js image as the build stage
FROM node:20-alpine AS builder

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the rest of the application files
COPY . .

# Build the application for production
RUN npm run build

#---------------------------STAGE 2---------------------------------------------

# Use a lightweight web server for the final production image
FROM nginx:alpine

# Set working directory in container
WORKDIR /usr/share/nginx/html

# Remove default nginx static files
RUN rm -rf ./*

# Copy built application from builder stage
COPY --from=builder /app/dist .

# Expose port 80 to be accessed outside the container
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

