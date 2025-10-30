pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/UtkarshRepos/my-terraform-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'echo "Building Docker image..."'
                sh 'docker build -t my-terraform-app .'
            }
        }

        stage('Run Terraform') {
            steps {
                sh 'echo "Initializing Terraform..."'
                sh 'terraform init'
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve to apply?', ok: 'Apply'
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Deployment Failed!'
        }
    }
}
