pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url:'https://github.com/suriya4799/php-project', branch: "master"
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
                    dockerImage.run('-p 3000:3000')
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
