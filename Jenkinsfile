pipeline {

environment {
dockerimagename = "tannuahuja14/react-app"
dockerImage = ""
}

agent any

stages {

stage('Checkout Source') {
steps {
git 'https://github.com/tannuahuja14/jenkins-kubernetes.git'
}
}

// stage('Build image') {
// steps{
// script {
// dockerImage = docker.build dockerimagename
// }
// }
// }
 stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t tannuahuja14/react-app .'
                }
            }
        }  

// stage('Pushing Image') {
// environment {
// registryCredential = 'dockerhub'
// }
// steps{
// script {
// docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
// dockerImage.push("latest")
// }
// }
// }
// }

// stage('Deploying React.js container to Kubernetes') {
// steps {
// script {
// kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
// }
// }
// }

// }

// }
