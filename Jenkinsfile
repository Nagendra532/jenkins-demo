pipeline {
    agent any

    environment {
    DOCKERHUB_CREDS = credentials('dockerhub-creds')
    IMAGE_NAME = 'nuthanprasad7999/myapp'
    IMAGE_TAG = "${BUILD_NUMBER}"
    DEV_CONTAINER = 'myapp-dev'
    PROD_CONTAINER = 'myapp-prod'
    PREVIOUS_TAG = "${BUILD_NUMBER.toInteger() - 1}"
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

        stage('Deploy to DEV') {
    steps {
        sh '''
        docker stop $DEV_CONTAINER || true
        docker rm $DEV_CONTAINER || true
        docker run -d -p 8081:80 --name $DEV_CONTAINER $IMAGE_NAME:$IMAGE_TAG
        '''
        }
     }

        stage('Deploy to PROD') {
    steps {
        sh '''
        docker stop $PROD_CONTAINER || true
        docker rm $PROD_CONTAINER || true
        docker run -d -p 8082:80 --name $PROD_CONTAINER $IMAGE_NAME:$IMAGE_TAG
        '''
       }
   }

    stage('Rollback (if needed)') {
    when {
        expression { return true } // manual enable when needed
    }
    steps {
        sh '''
        docker stop $PROD_CONTAINER || true
        docker rm $PROD_CONTAINER || true
        docker run -d -p 80:80 --name $PROD_CONTAINER $IMAGE_NAME:$PREVIOUS_TAG
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

