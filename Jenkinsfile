pipeline {
    agent any

    environment {
        IMAGE_NAME = 'praveshm007/simpleproject'
        IMAGE_TAG = 'latest
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Pravesh-M/Jenkins-Mvn.git'
            }
        }

        stage('Build WAR with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }

    post {
        success {
            echo 'Docker image pushed successfully.'
        }
        failure {
            echo 'Something went wrong!'
        }
    }
}
