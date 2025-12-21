# Imagen base con Python
FROM python:3.11-slim

# Establecer directorio de trabajo
WORKDIR /robot

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements si lo tienes, o instalar directamente
COPY requirements.txt* ./

# Instalar Robot Framework y librerías comunes
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary \
    robotframework-requests \
    robotframework-pabot

# Copiar el proyecto completo
COPY . .

# Crear directorio para resultados
RUN mkdir -p /robot/results

# Comando por defecto
CMD ["robot", "--outputdir", "results", "tests/"]