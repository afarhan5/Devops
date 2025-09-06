FROM alpine
LABEL maintainer="A.Farhan <arshadfarhan005@gmail.com>"
RUN apk update 
RUN apk add nodejs
COPY . /app
WORKDIR /app
CMD ["node", "index.js"]
