pipeline {
    environment {
        dockerImageName = "tannuahuja14/react-app"
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
                    sh 'docker build -t $dockerImageName .'
                }
            }
        }

        stage('Pushing Image') {
            environment {
                registryCredential = 'dockerhub'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        sh 'docker login -u tannuahuja14 -p ${dockerhub}'      
                        dockerImage.push("latest")
                        

}
            
                    }
                }
            }
        }
*/
        // stage('Deploying React.js container to Kubernetes') {
        //     steps {
        //         script {
        //             kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
        //         }
        //     }
        // }
        /*
    }
}
