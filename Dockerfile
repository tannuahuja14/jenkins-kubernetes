# Use a valid Node.js version tag, e.g., 14-alpine3.16
FROM node:14-alpine3.16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install Node.js dependencies
RUN npm install

# Copy all files from the current directory to the container's working directory
COPY . .

# Expose port 3000 (if your application listens on this port)
EXPOSE 3000

# Set the command to run your application
CMD ["npm", "start"]
