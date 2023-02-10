pipeline {
    agent any
    stages {
        stage('stop docker container if exists') {
            steps {
                sh 'docker stop amit || true'
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
    }
}
