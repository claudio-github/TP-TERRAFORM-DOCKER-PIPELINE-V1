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

        stage('Terraform Init') {
            steps{
                script{
                    sh "terraform init \
                            -backend-config='resource_group_name=$RMT_ST_RG' \
                            -backend-config='storage_account_name=$RMT_ST_ST' \
                            -backend-config='container_name=$RMT_ST_CI' \
                            -backend-config='key=$RMT_ST_KEY'"
                }
            }  
        }

        stage('Terraform Format') {
            steps{
                script{
                    sh 'terraform fmt'
                }
            }
        }

        stage('Terraform Validate') {
            steps{
                script{
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps{
                script{
                    sh "terraform plan"                    
                }
            }
        }


    }

}
