stage('Run Terraform') {
    steps {
        echo 'Initializing Terraform...'
        sh 'docker run --rm --entrypoint="" -v $(pwd):/app -w /app my-terraform-app terraform init'
    }
}

stage('Terraform Plan') {
    steps {
        sh 'docker run --rm --entrypoint="" -v $(pwd):/app -w /app my-terraform-app terraform plan'
    }
}

stage('Terraform Apply') {
    steps {
        sh 'docker run --rm --entrypoint="" -v $(pwd):/app -w /app my-terraform-app terraform apply -auto-approve'
    }
}
