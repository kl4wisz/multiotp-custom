FROM multiotp/multiotp-open-source

RUN apt-get update && \
    apt-get install -y \
        lsb-release \
        ca-certificates \
        apt-transport-https \
        curl \
        gnupg && \
    curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /usr/share/keyrings/sury-php.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury-php.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get clean
