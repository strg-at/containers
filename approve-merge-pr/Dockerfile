FROM node:22.15.1-alpine@sha256:152270cd4bd094d216a84cbc3c5eb1791afb05af00b811e2f0f04bdc6c473602

WORKDIR /app

COPY . .

RUN npm ci

USER node
