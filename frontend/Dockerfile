FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build -- --configuration=production

FROM nginx:alpine
COPY --from=build /app/dist/rge_allocator_frontend /usr/share/nginx/html
EXPOSE 4200