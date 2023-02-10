pipeline {
    agent { any }
    stage('Build Docker') {
        sh "docker build -t myflaskapp ."
    }
    stage("run docker container") {
        sh "docker run -p 5000:5000 myflaskapp"
    }
}
