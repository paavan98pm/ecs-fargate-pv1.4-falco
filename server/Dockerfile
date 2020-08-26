FROM paavanmistry/ecs-fargate-pv1.4-falco:latest
COPY . .
RUN apt update && apt install ncat -y
EXPOSE 443
CMD ["pdig", "-a", "./init.sh"]
