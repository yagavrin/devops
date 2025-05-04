pipeline {
    agent any
    environment {
        GIT_REPOSITORY_URL = 'https://github.com/yagavrin/vector-role.git'
        GIT_BRANCH = 'main'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: GIT_REPOSITORY_URL, branch: GIT_BRANCH
            }
        }
        stage('Run Molecule Tests') {
            steps {
                script {
                    try {
                        sh 'molecule test'
                    } catch (error) {
                        unstable("Molecule tests failed")
                    }
                }
            }
        }
    }
}