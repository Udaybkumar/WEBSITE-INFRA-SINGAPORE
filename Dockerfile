FROM nginx:alpine

# 1. Clear the default Nginx placeholder page
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy ALL files from current folder to the Nginx web folder
# (The .dockerignore file will filter out the bad stuff)
COPY . /usr/share/nginx/html

# 3. Standard Nginx startup
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]