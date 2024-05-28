FROM node:20.13.1-alpine
RUN addgroup app && adduser -S -G app app
WORKDIR /app
COPY package*.json ./
RUN chown -R app:app /app
USER app
RUN npm install
COPY --chown=app:app . .
USER app
ENV API_URL=http://api.myapp.com/
EXPOSE 3000
CMD ["npm", "start"]
