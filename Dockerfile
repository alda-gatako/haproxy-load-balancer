# Small Node.js base image
FROM node:20-alpine
WORKDIR /app
# Install only production dependencies first, so Docker can cache this layer
COPY server/package*.json ./server/
RUN cd server && npm install --omit=dev
# Copy the app code and the front-end files
COPY server ./server
COPY public ./public
WORKDIR /app/server
EXPOSE 3000
CMD ["node", "server.js"]
