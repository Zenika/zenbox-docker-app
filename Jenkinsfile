pipeline {
    agent any

    stages {
        stage('lint') {
            steps {
                sh 'yarn'
                sh 'yarn lint'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker build -t local/application:${BRANCH_NAME} .'
                sh 'docker-compose -p ${BRANCH_NAME}-demo up -d'
            }
        }
    }
}
