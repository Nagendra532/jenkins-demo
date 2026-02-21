pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t YOUR_DOCKERHUB_USERNAME/myapp:v1 .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push YOUR_DOCKERHUB_USERNAME/myapp:v1'
            }
        }
    }
}
