pipeline {
    agent {
        label 'terraform-agent'
    }

    options {
        skipDefaultCheckout(true)  
    }
  
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_Access_key')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_Secret_access_key')
        AWS_REGION = credentials('AWS_Region')
    }
  
    stages{
        stage('Checkout scm') {
            steps {
                checkout scm
            }
        } 

        stage('Inicializar Terraform') {
            steps {
                bat 'terraform init'
            }
        } 

        stage('Visualizar Terraform Providers') {
            steps {
                bat 'terraform providers'
            }
        } 
        
        stage('Terraform Graph') {
            steps {
                bat 'terraform graph | dot -Tsvg > graph.svgt'
            }
        } 
        
        stage('Terraform Plan') {
            when{
                branch "dev"
            }
            steps {
                bat 'terraform plan'
            }
        } 

        stage('Terraform Apply') {
            when{
                branch "main"
            }
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
    }
}  
