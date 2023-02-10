pipeline {
    agent any 
    stage('Build Docker') {
        steps {
            sh "docker build -t myflaskapp ."
        }
    }
    stage("run docker container") {
        steps {
            sh "docker run -p 5000:5000 myflaskapp"
        }
    }
}
