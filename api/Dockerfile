# Use an official Node.js runtime as the base image
FROM node:20.10-alpine

# Set the working directory in the container to /api
WORKDIR /api

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install the API's dependencies in the container
RUN npm install

# Copy the rest of the API's source code to the working directory
COPY . ./

# Expose port 3000 for the API
EXPOSE 3000

# Start the API
CMD [ "npm", "start" ]