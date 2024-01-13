# Use an official NGINX image as the base image
FROM nginx:latest

# Install Git to clone the private repository
RUN apt-get update && \
    apt-get install -y git

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Remove existing files
RUN rm -rf ./*

# Clone the private repository using the personal access token
RUN git clone https://github.com/Yash3148/Animated-Login-page.git .

# Expose port 80 to allow external access
EXPOSE 80

# Command to start NGINX and serve the website
CMD ["nginx", "-g", "daemon off;"]
