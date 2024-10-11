# Use the official Node.js image as a base
FROM node:20

# Install required dependencies for building native modules
RUN apt-get update && apt-get install -y \
    build-essential \
    avahi-daemon \
    libavahi-compat-libdnssd-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /root/bot/

# Clone the GitHub repository
RUN git clone https://github.com/sataniceypz/izumi-qr .

# Install dependencies
RUN npm install --network-concurrency 1

# Expose the port your app runs on (modify if your app uses a different port)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
