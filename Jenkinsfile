pipeline {
    agent any

    environment {
        DOCKER_IMAGE_BACKEND = 'fatimazahraerhmaritlemcani132/pfa-ci-cd-backend:v1.0'
        DOCKER_IMAGE_FRONTEND = 'fatimazahraerhmaritlemcani132/frontend-image:v1.0'
        DOCKER_IMAGE_DB = 'fatimazahraerhmaritlemcani132/mysql:v1.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch from GitHub
                git branch: 'main',
                    url: 'https://github.com/fatitlem/Pipeline-CI-CD.git',
                    credentialsId: 'cred'
            }
        }

        stage('Pull Docker Images') {
            steps {
                script {
                    // Pull the latest Docker images
                    sh "docker pull ${env.DOCKER_IMAGE_FRONTEND}"
                    sh "docker pull ${env.DOCKER_IMAGE_BACKEND}"
                    sh "docker pull ${env.DOCKER_IMAGE_DB}"
                }
            }
        }

        stage('Clean Up Old Containers') {
            steps {
                script {
                    // Stop and remove existing containers if they are running
                    sh 'docker stop frontend-container || true'
                    sh 'docker rm frontend-container || true'

                    sh 'docker stop backend-container || true'
                    sh 'docker rm backend-container || true'

                    sh 'docker stop db-container || true'
                    sh 'docker rm db-container || true'
                }
            }
        }
        stage('Deploy Database') {
            steps {
                script {
                    // Run the latest database Docker container
                    sh "docker run -d --name db-container ${env.DOCKER_IMAGE_DB}"
                }
            }
        }
        stage('Deploy Frontend') {
            steps {
                script {
                    // Run the latest frontend Docker container
                    sh "docker run -d --name frontend-container -p 80:80 ${env.DOCKER_IMAGE_FRONTEND}"
                }
            }
        }

        stage('Deploy Backend') {
            steps {
                script {
                    // Run the latest backend Docker container
                    sh "docker run -d --name backend-container ${env.DOCKER_IMAGE_BACKEND}"
                }
            }
        }


    }

    post {
        always {
            cleanWs()
        }
    }
}