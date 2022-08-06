FROM node:18-alpine
ENV NODE_ENV="development"

# Create app directory
WORKDIR /app

RUN apk add --no-cache libc6-compat bash

# Language
ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8


# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN yarn install --immutable && yarn rebuild




# RUN mkdir -p /usr/share/fonts/nanumfont
# RUN wget http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip
# RUN unzip NanumFont_TTF_ALL.zip -d /usr/share/fonts/nanumfont
# RUN fc-cache -f && rm -rf /var/cache/*

# RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
#     echo "Asia/Seoul" > /etc/timezone

#COPY packs/packages/             ./packages/
#COPY packs/platform-server/dist  ./platform-server/

EXPOSE 3000

CMD [ "yarn", "run", "start:dev" ]

