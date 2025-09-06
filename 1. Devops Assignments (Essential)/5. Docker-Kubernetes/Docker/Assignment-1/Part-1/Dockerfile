FROM nginx

# Copy HTML files to the container
COPY index-1.html /html/index-1.html
COPY index-2.html /html/index-2.html

# Copy the switch script
COPY switch.sh /switch.sh
RUN chmod +x /switch.sh

# Startup command: run switch.sh every 60 seconds and start nginx
CMD ["sh", "-c", "while true; do /switch.sh; sleep 60; done & nginx -g 'daemon off;'"]
