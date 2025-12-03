pipeline {
    agent any

    environment {
        AWS_REGION = "us-west-2"
        REGISTRY = "713608733208.dkr.ecr.us-west-2.amazonaws.com"
        IMAGE = "microservices"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/abdelkhalek97/Microservices.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${REGISTRY}/${IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh """
                    aws ecr get-login-password --region $AWS_REGION | \
                      docker login --username AWS --password-stdin $REGISTRY
                    docker push ${REGISTRY}/${IMAGE}:${env.BUILD_NUMBER}
                    """
                }
            }
        }

        stage('Update Helm Values') {
            steps {
                script {
                    sh """
                    sed -i 's/tag:.*/tag: ${env.BUILD_NUMBER}/' helm/flask-app/values.yaml
                    git config user.email "ci@jenkins"
                    git config user.name "Jenkins CI"
                    git commit -am "Update image tag to ${env.BUILD_NUMBER}"
                    git push origin main
                    """
                }
            }
        }

        stage('Trigger Argo CD Sync') {
            steps {
                script {
                    sh "argocd app sync flask-app -n argocd"
                }
            }
        }
    }
}
