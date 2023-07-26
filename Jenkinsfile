pipeline {
    environment {
        dockerImageName = "tannuahuja14/react-app"
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
                    sh 'docker build -t $dockerImageName .'
                }
            }
        }

        stage('Pushing Image') {
            environment {
                registryCredential = credentials('dockerhub') // Use the ID of your Docker Hub credentials in Jenkins
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        sh "docker login -u ${registryCredential.username} -p ${registryCredential.password}"
                        sh "docker push $dockerImageName"
                    }
                }
            }
        }
        
        // stage('Deploying React.js container to Kubernetes') {
        //     steps {
        //         script {
        //             kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        //         }
        //     }
        // }
    }
}
