
FROM gitpod/workspace-full:2023-08-19-14-41-20

USER gitpod
RUN sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN sudo apt update && sudo apt install -y mosquitto
RUN wget https://ftp.acc.umu.se/mirror/eclipse.org/hono/hono-cli-2.4.0
RUN chmod +x hono-cli-2.4.0 