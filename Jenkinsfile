pipeline {
    environment {
        dockerImageName = "tannuahuja/react-app"
        dockerImage = ""
    }

    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git 'https://github.com/tannuahuja14/jenkins-kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build dockerImageName // Fixed the variable name to dockerImageName
                }
            }
        }

        stage('Pushing Image') {
            environment {
                registryCredential = 'dockerhublogin'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage('Deploying the application to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'kubernetes')
                }
            }
        }

        // stage('Deploy to Kubernetes') {
        //     steps {
        //         sh 'kubectl apply -f deploymentservice.yaml'
        //     }
        // }
    }
}
