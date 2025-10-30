pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/UtkarshRepos/my-terraform-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-terraform-app .'
            }
        }

        stage('Run Terraform') {
            steps {
                echo 'Initializing Terraform...'
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform apply -auto-approve'
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
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/UtkarshRepos/my-terraform-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-terraform-app .'
            }
        }

        stage('Run Terraform') {
            steps {
                echo 'Initializing Terraform...'
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'docker run --rm -v $(pwd):/app -w /app my-terraform-app terraform apply -auto-approve'
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
