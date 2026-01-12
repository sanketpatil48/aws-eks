pipeline {
    agent any

triggers {
        cron('H/1 * * * *')
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sanketpatil48/aws-eks.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Example:
                // sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Example:
                // sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
