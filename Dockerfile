FROM debian:latest

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive
COPY sources /etc/apt/sources

# Install TightVNC, XFCE, and other utilities
RUN apt update && apt install -y \
    tightvncserver \
    xfce4 \
    xterm 

#RUN apt install firefox-esr
# Set p VNC
RUN mkdir /root/.vnc
# Set a VNC password
RUN echo "useruseruser" | vncpasswd -f > /root/.vnc/passwd
# Make sure the VNC password file is properly secured
RUN chmod 600 /root/.vnc/passwd

# Copy a VNC xstartup script (if you have one) or create it
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# Expose VNC port
EXPOSE 5901

# A simple startup script to keep the container running and start the VNC server
CMD ["sh", "-c", "tightvncserver :1 -geometry 1280x720 -depth 24 && tail -f /dev/null"]

