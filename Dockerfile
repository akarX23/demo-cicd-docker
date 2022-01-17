FROM node:16-alpine3.11

# Specify all your env variables here
ARG prod=false
ARG NEXT_PUBLIC_HELLO_WORLD
ARG SOME_OTHER_VARIABLE

# create & set working directory
RUN mkdir -p /usr/src

WORKDIR /usr/src

# copy source files
COPY . /usr/src

# Conditionally create a .env file if environment is production and print it's contents
RUN if [ "$prod" = "true" ]; then \
    echo "NEXT_PUBLIC_HELLO_WORLD=$NEXT_PUBLIC_HELLO_WORLD" >> .env.production && \
    echo "SOME_OTHER_VARIABLE=$SOME_OTHER_VARIABLE" >> .env.production &&  cat .env.production; else echo "Environment local" ; fi

# install dependencies
RUN npm install

# build app
RUN npm run build

EXPOSE 3000
CMD ["npm","run","start"]
