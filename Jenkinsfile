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
                    docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                echo 'Ejecutando tests de Robot Framework...'
                script {
                    docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}").inside {
                        bat 'robot --outputdir results --output output.xml --log log.html --report report.html .'
                    }
                }
            }
        }

        stage('Publish Test Results') {
            steps {
                echo 'Publicando resultados.. .'
                // Versión simplificada sin parámetros problemáticos
                robot outputPath: 'results'
            }
        }
    }

    post {
        always {
            echo 'Archivando reportes...'
            archiveArtifacts artifacts: 'results/**/*', allowEmptyArchive: true
        }
        success {
            echo '✅ Tests ejecutados exitosamente!'
        }
        failure {
            echo '❌ Los tests fallaron.  Revisa los reportes.'
        }
    }
}