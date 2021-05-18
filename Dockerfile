# Build Phase
#named builder
# FROM node:lts-alpine3.11 as builder 
#unnamed builder
FROM node:lts-alpine3.11 

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Run Phase
FROM nginx
# for AWS Beanstalk
EXPOSE 80
# For named 
# COPY --from=builder /app/build /usr/share/nginx/html

# For unnamed builder
COPY --from=0 /app/build /usr/share/nginx/html

