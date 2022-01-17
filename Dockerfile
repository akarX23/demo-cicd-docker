FROM node:16-alpine3.11

# create & set working directory
RUN mkdir -p /usr/src

WORKDIR /usr/src

# copy source files
COPY . /usr/src

# install dependencies
RUN npm install

# build app
RUN npm run build

EXPOSE 3000
CMD ["npm","run","start"]
