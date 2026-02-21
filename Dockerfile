pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker --version'
                sh 'docker build -t myapp:v1 .'
            }
        }

        stage('List Images') {
            steps {
                sh 'docker images'
            }
        }
    }
}
