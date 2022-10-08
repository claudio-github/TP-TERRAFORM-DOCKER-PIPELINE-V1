pipeline {

    agent any

        parameters {
        choice choices: ['apply', 'destroy'], name: 'action'
    }

    environment {
        ARM_CLIENT_ID=credentials('ARM_CLIENT_ID')
        ARM_TENANT_ID=credentials('ARM_TENANT_ID')
        ARM_SUBSCRIPTION_ID=credentials('ARM_SUBSCRIPTION_ID')
        ARM_CLIENT_SECRET=credentials('ARM_CLIENT_SECRET')
        RMT_ST_RG=credentials('RMT_ST_RG')
        RMT_ST_ST=credentials('RMT_ST_ST')
        RMT_ST_CI=credentials('RMT_ST_CI')
        RMT_ST_KEY=credentials('RMT_ST_KEY')
    }

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
                    dir('Terraform')
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
