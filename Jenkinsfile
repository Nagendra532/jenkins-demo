pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning repo...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t my-nginx-app .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running container...'
                bat 'docker run -d -p 8090:80 --name my-nginx-container my-nginx-app'
            }
        }

    }
}
