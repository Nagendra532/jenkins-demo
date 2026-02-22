pipeline {
    agent any
    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        IMAGE_NAME = 'nuthanprasad7999/myapp'
        IMAGE_TAG = "${BUILD_NUMBER}"
        CONTAINER_NAME = 'myapp-container'
    }

    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
      stage('Cleanup') {
         steps {
              sh 'docker image prune -f'
    }
}

    }
}

