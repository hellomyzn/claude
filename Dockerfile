FROM node:20-alpine

RUN apk add --no-cache \
    vim \
    git \
    && npm install -g @anthropic-ai/claude-code \
    && rm -rf /root/.npm

ENV EDITOR=vim
ENV VISUAL=vim

WORKDIR /workspace

CMD ["claude"]
