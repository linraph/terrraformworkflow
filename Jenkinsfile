pipeline {

    agent any
 
    parameters {

        booleanParam(name: 'DESTROY', defaultValue: false, description: 'Set to true to destroy infrastructure')

    }
 
    environment {

        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')

        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')

        AWS_REGION            = 'us-east-1'

    }
 
    stages {

        stage('Checkout') {

            steps {

                checkout scmGit(

                    branches: [[name: '*/main']],

                    extensions: [],

                    userRemoteConfigs: [[url: 'https://github.com/linraph/terrraformworkflow.git']]

                )

            }

        }
 
        stage('Init') {

            steps {

                sh 'terraform init'

            }

        }
 
        stage('Validate') {

            steps {

                sh 'terraform validate'

            }

        }
 
        stage('Format') {

            steps {

                sh 'terraform fmt'

            }

        }
 
        stage('Plan') {

            steps {

                sh 'terraform plan -out=tfplan'

            }

        }
 
        stage('Apply') {

            steps {

                sh 'terraform apply tfplan'

            }

        }
 
        stage('Destroy') {

            when {

                expression { return params.DESTROY }

            }

            steps {

                input message: 'Do you want to destroy?', ok: 'Destroy it'

                sh 'terraform init'

                sh 'terraform destroy --auto-approve'

            }

        }

    }

}
 