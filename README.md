# Debian Docker Container with TightVNC and XFCE

This project provides a Docker container setup for running a Debian-based system with TightVNC and the XFCE desktop environment. It's designed to allow remote desktop access to a lightweight Linux desktop via VNC.

## Features

- **Debian Latest**: The container is based on the latest version of Debian.
- **TightVNC Server**: Allows for VNC access to the container's desktop environment.
- **XFCE Desktop**: A lightweight and fully functional desktop environment.
- **Dockerized**: Easy to deploy and run on any system with Docker.

## Prerequisites

- Docker installed on your host machine.
- A VNC client installed on your host machine to connect to the Docker container.

## Installation and Usage

### Building the Docker Image

Clone the repository and navigate into the project directory:

\```bash
git clone <repository-url>
cd <project-directory>
\```

Build the Docker image:

\```bash
docker build -t debian-tightvnc .
\```

### Running the Container

To start the container in detached mode and expose the VNC server on port 5901:

\```bash
docker run -d -p 5901:5901 debian-tightvnc
\```

### Connecting via VNC

Open your VNC client and connect to `localhost:5901`. When prompted for a password, enter the password you configured in the Dockerfile (default is `your_password`).

## Customization

You can customize the VNC server settings, including the password and display options, by modifying the Dockerfile before building the image.

- To change the VNC password, update the `echo "your_password" | vncpasswd -f > /root/.vnc/passwd` line with your desired password.
- Adjust the `geometry` and `depth` parameters in the CMD command in the Dockerfile to change the screen size and color depth.

## Security Considerations

This setup is intended for development and testing purposes. Running a VNC server accessible over the network can pose security risks. If you're deploying this in a production environment, consider implementing additional security measures, such as SSH tunneling or VPN access.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Acknowledgments

- Debian: https://www.debian.org/
- TightVNC: http://www.tightvnc.com/
- XFCE: https://xfce.org/
