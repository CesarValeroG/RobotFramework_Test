FROM python:3.11-slim

WORKDIR /robot

# Instalar Chrome y dependencias
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    unzip \
    ca-certificates \
    && wget -q -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y /tmp/google-chrome-stable_current_amd64.deb \
    && rm /tmp/google-chrome-stable_current_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.txt ./

# Instalar Robot Framework
RUN pip install --no-cache-dir -r requirements.txt

# Copiar proyecto
COPY . .

# Crear directorio de resultados
RUN mkdir -p /robot/results

# Comando por defecto - ejecuta SOLO TCX. robot y ApiTesting.robot
CMD ["robot", "--outputdir", "results", "tests/TCX.robot", "tests/ApiTesting.robot"]