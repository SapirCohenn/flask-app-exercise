pipeline {
    agent any
    stages {
        stage('stop docker container if exists') {
            steps {
                sh 'docker stop amit || true'
                sh 'docker rm amit || true'
            }
        }
        stage('Build Docker') {
            steps {
                sh "docker build -t myflaskapp:${env.BUILD_NUMBER} ."
            }
        }
        stage('run docker container') {
            steps {
                sh 'docker run --name amit -d -p 5000:5000 myflaskapp '
            }
        }
        stage('aws credentials and push ecr') {
            steps {
                script {
                    withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'sapircohen_credentials',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {
                        // AWS Code
                        docker.withRegistry('https://718688527926.dkr.ecr.us-east-1.amazonaws.com/', 'ecr:us-east-1:aws-credentials') {
                            sh "docker push myflaskapp:${env.BUILD_NUMBER}"
                        }
            }
                }
            }
        }
    }
}
