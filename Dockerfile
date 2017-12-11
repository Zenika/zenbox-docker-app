FROM zenika/alpine-node

COPY build /usr/src/app
RUN npm install -g serve
CMD serve -s /usr/src/app
