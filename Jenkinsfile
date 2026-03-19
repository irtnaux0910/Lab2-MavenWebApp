pipeline {
    agent any
    tools {
        maven "MAVEN3" 
    }
    environment {
        DOCKERHUB_PWD = credentials('CredentialID_DockerHubPWD') 
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/irtnaux0910/Lab2-MavenWebApp' 
            }
        }
    stage('Build maven project') {
            steps {
                bat 'mvn clean install' 
            }
        }
        stage('Docker build & login') {
            steps {
                script {
                    sh 'docker build -t xuantri88071/lab3-maven-app:1.0 .'
                    sh 'docker login -u xuantri88071 -p ${DOCKERHUB_PWD}'
                }
            }
        }
        stage('Docker push') {
            steps {
                sh 'docker push xuantri88071/lab3-maven-app:1.0'
            }
        }
    }
}
