FROM node:14

# Install dependencies for Puppeteer
RUN apt-get update && \
  apt-get install -y wget gnupg2 ca-certificates libnss3-dev libatk-bridge2.0-0 libx11-xcb-dev libgtk-3-0 libasound2 libxss1 libgbm1 libpango-1.0-0 libcairo2-dev

# Install latest version of Chromium
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable

# Set the environment variable to run in headless mode
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/google-chrome-stable"
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

ARG LAMBDA_TASK_ROOT