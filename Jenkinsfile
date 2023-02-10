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
                    withCredentials([string(credentialsId: 'ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                         string(credentialsId: 'SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh '''
                            aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                            aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                            aws configure set default.region us-west-2
                            '''
                         }

                        // AWS Code
                        docker.withRegistry('https://718688527926.dkr.ecr.us-east-1.amazonaws.com/', 'aws_credentials') {
                            sh "docker push myflaskapp:${env.BUILD_NUMBER}"
                        }
                }
            }
        }
    }
}
