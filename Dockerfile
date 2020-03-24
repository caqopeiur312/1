FROM alpine:3.5

ENV UUID=487a616a-b0a6-4541-936c-f51467d9f610
ENV ALTERID=64
ENV V2RAY_PORT=9199
ENV V2RAY_PATH=ray

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

ADD run.sh /run.sh
RUN chmod +x run.sh

ENTRYPOINT run.sh

EXPOSE ${V2RAY_PORT}
