pipeline {

    agent any

    stages{
        stage('Checkout files') {
            steps{
                script{
                    sh 'ls -la'
                }
            }
        }

         stage('Terraform version') {
            steps{
                script{
                    sh 'terraform version'
                }
            }
        }

    }

}
