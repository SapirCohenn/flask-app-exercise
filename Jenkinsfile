/* Requires the Docker Pipeline plugin */
/* pipeline {
    agent { docker { image 'python:3.10.7-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
            }
        }
    }
}
*/
pipeline {
    agent { docker { image 'python:3.10.7-alpine' } }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myflaskapp .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker tag myflaskapp $DOCKER_USERNAME/myflaskapp:latest'
                sh 'docker push $DOCKER_USERNAME/myflaskapp:latest'
            }
        }
    }
}
