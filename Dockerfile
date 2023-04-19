FROM node:alpine3.16 AS build
WORKDIR /client
COPY . .
RUN npm install 

FROM gcr.io/distroless/nodejs18-debian11
COPY --from=build /client /client
WORKDIR /client
EXPOSE 3000
CMD ["npm", "start"]
