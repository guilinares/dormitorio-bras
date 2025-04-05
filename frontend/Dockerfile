FROM node:20 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build -- --configuration=production

FROM nginx:alpine
COPY --from=build /app/dist/rge_allocator_frontend/browser /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 4200
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
