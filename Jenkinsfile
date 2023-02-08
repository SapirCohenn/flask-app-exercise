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
node {
   stage('Get Source') {
      // copy source code from local file system and test
      // for a Dockerfile to build the Docker image
      git ('https://github.com/SapirCohenn/flask-app-exercise.git')
      if (!fileExists("Dockerfile")) {
         error('Dockerfile missing.')
      }
   }
   stage('Build Docker') {
       // build the docker image from the source code using the BUILD_ID parameter in image name
         sh "docker build -t myflaskapp ."
   }
   stage("run docker container"){
        sh "docker run -p 5000:5000 myflaskapp"
    }
}
