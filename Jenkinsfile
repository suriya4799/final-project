pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url:'https://github.com/suriya4799/final-project', branch: "master"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t suriya4799/final-project:v1 .'
                    sh 'docker images'
                }
            }
        }
        stage('Docker login and Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-pwd', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push suriya4799/final-project:v1'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'sudo docker run -itd --name My-final-project-conta1 -p 8091:8091 suriya4799/final-project:v1'
                }
            }
        }
    }

}
