FROM node:20.10.0-bullseye
# ENV HOME=/app/vite-project
WORKDIR /app/vite-project
ADD ./vite-project /app/vite-project
RUN apt update \
	&& yarn install
EXPOSE 5173
CMD ["yarn", "dev", "--host"]