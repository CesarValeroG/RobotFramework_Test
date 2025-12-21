pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "robot-framework-test"
        ROBOT_REPORTS_DIR = "results"
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
                        sh 'robot --outputdir results --output output.xml --log log.html --report report.html .'
                    }
                }
            }
        }

        stage('Publish Test Results') {
            steps {
                echo 'Publicando resultados.. .'
                robot(
                    outputPath: 'results',
                    outputFileName: 'output.xml',
                    reportFileName: 'report.html',
                    logFileName: 'log.html',
                    disableArchiveOutput: false,
                    passThreshold: 80,
                    unstableThreshold: 70,
                    onlyCritical: true
                )
            }
        }
    }

    post {
        always {
            echo 'Limpiando workspace...'
            cleanWs()
        }
        success {
            echo '✅ Tests ejecutados exitosamente!'
        }
        failure {
            echo '❌ Los tests fallaron.  Revisa los reportes.'
        }
    }
}