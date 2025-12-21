pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "robot-framework-test"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Clonando repositorio...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Construyendo imagen Docker...'
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                echo 'Ejecutando tests de Robot Framework...'
                script {
                    // Ejecutar contenedor y copiar resultados
                    bat """
                        docker run --name robot-test-${BUILD_NUMBER} ${DOCKER_IMAGE}:${BUILD_NUMBER}
                        docker cp robot-test-${BUILD_NUMBER}:/robot/results ./results
                        docker rm robot-test-${BUILD_NUMBER}
                    """
                }
            }
        }

        stage('Publish Test Results') {
            steps {
                echo 'Publicando resultados.. .'
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            echo 'Archivando reportes...'
            archiveArtifacts artifacts: 'results/**/*', allowEmptyArchive: true

            echo 'Limpiando imagen Docker...'
            script {
                bat "docker rmi ${DOCKER_IMAGE}:${BUILD_NUMBER} || exit 0"
            }
        }
        success {
            echo '✅ Tests ejecutados exitosamente!'
        }
        failure {
            echo '❌ Los tests fallaron.  Revisa los reportes.'
        }
    }
}