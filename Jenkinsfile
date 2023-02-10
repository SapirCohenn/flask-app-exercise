pipeline {
    agent any
    stages {
        stage('Build Docker') {
            steps {
                sh 'docker build -t myflaskapp .'
            }
        }
        stage('run docker container') {
            steps {
                sh 'docker run -d -p 5000:5000 myflaskapp --name amit'
            }
        }
    }
}
