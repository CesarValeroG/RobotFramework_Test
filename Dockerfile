FROM python:3.11-slim

WORKDIR /robot

# Instalar Chrome y dependencias
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    unzip \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list. d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.txt ./

# Instalar Robot Framework
RUN pip install --no-cache-dir -r requirements.txt

# Copiar proyecto
COPY . .

# Crear directorio de resultados
RUN mkdir -p /robot/results

# Comando por defecto
#CMD ["robot", "--outputdir", "results", ". "]
CMD ["robot", "--outputdir", "results", "tests/ApiTesting", "tests/TCX"]