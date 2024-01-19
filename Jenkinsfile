pipeline {
    environment {
        dockerImageName = "tannuahuja14/react-app"
        dockerImageTag = "v2.0" // Specify the desired tag for your Docker image
        registryCredential = 'dockerhublogin'
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
                    // Build the Docker image with the specified tag
                    docker.build("${dockerImageName}:${dockerImageTag}")
                }
            }
        }

        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image with the specified tag
                    docker.image("${dockerImageName}:${dockerImageTag}").push()
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to the registry
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        docker.image("${dockerImageName}:${dockerImageTag}").push()
                    }
                }
            }
        }

        stage('Deploying to Kubernetes') {
            steps {
                script {
                    // Deploy the application to Kubernetes using the provided configuration file
                    kubernetesDeploy(configs: 'deploymentservice.yaml', kubeconfigId: 'kubernetes')
                }
            }
        }
    }
}
