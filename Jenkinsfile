pipeline {
  agent any
  stages {
    stage('Log') {
      steps {
        sh 'ls -la'
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -f Dockerfile -t bellacoda99/jenkins.git .'
      }
    }

    stage('Log into Dockerhub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'DOCKERHUB_TOKEN', usernameVariable: 'DOCKERHUB_USER')]) {
          echo '${env.DOCKERHUB_USER}'
          echo '${env.DOCKERHUB_TOKEN}'
        	sh "docker login -u ${env.DOCKERHUB_USER} -p ${env.DOCKERHUB_TOKEN}"
          sh 'docker push bellacoda99/jenkins.git'
        }
      }
    }
  }
}
