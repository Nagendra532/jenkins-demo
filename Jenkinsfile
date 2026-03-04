pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nuthanprasad7999/my-nginx-app"
    }

    stages {

        stage('Build Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                                usernameVariable: 'USER',
                                passwordVariable: 'PASS')]) {
                    bat "docker login -u %USER% -p %PASS%"
                }
            }
        }

        stage('Push Image') {
            steps {
                bat "docker push %DOCKER_IMAGE%"
            }
        }

    }
}
