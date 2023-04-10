FROM node:lts

WORKDIR /frontend

COPY . .

RUN npm i npm -g

RUN npm i && npm run build && npm prune 

EXPOSE 3000

CMD ["npm", "start"]

# https://levelup.gitconnected.com/i-created-a-voice-chatbot-powered-by-chatgpt-api-here-is-how-6302d555b949

# https://medium.com/@neonforge/chatgpt-api-python-web-app-tutorial-personalised-ai-chatbot-assistant-with-a-twist-ded4da970c1d