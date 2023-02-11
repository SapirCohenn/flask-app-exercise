pipeline {
    agent any
    stages {
        /*stage('stop docker container if exists') {
            steps {
                sh 'docker stop amit || true'
                sh 'docker rm amit || true'
            }
        }
        */
        stage('Build Docker') {
            steps {
                sh 'docker build -t flask_cdpipeline .'
                sh 'docker tag flask_cdpipeline:latest 718688527926.dkr.ecr.us-east-1.amazonaws.com/flask_cdpipeline:latest'
            }
        }
        /*stage('run docker container') {
            steps {
                sh 'docker run --name amit -d -p 5000:5000 flask_cdpipeline '
            }
        }
        */
        stage('aws credentials and push ecr') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                         string(credentialsId: 'SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh '''
                            aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                            aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                            aws configure set default.region us-east-1
                            '''
                         }
                            // AWS Code
                            sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 718688527926.dkr.ecr.us-east-1.amazonaws.com'
                            sh 'docker push 718688527926.dkr.ecr.us-east-1.amazonaws.com/flask_cdpipeline:latest'
                }
            }
        }
        stage('pull image from ecr') {
            steps {
                sh '$(aws ecr get-login --no-include-email --region us-east-1)'
                sh 'docker pull 718688527926.dkr.ecr.us-east-1.amazonaws.com/flask_cdpipeline:latest'
            }
        }
    }
}
