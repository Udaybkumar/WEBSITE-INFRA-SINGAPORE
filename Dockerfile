FROM nginx:alpine

# 1. Clear default Nginx files
RUN rm -rf /usr/share/nginx/html/*

# 2. Copy the CONTENTS of the src folder (files inside src) to the web root
# The trailing slash on 'src/' is critical!
COPY src/ /usr/share/nginx/html/

# 3. Permissions fix (Standard for Windows/WSL files)
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]