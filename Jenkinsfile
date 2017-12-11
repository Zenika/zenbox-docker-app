pipeline {
    agent any

    stages {
        stage('lint') {
            steps {
                sh 'docker run -v $(pwd):/usr/src/app zenika/alpine-node yarn'
                sh 'docker run -e CI=true -v $(pwd):/usr/src/app zenika/alpine-node yarn test'
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
