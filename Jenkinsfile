pipeline {
    agent any

    stages {
        stage('lint') {
            steps {
                sh 'printenv'
                sh 'docker run -v $JENKINS_INSTALL$PWD:/usr/src/app zenika/alpine-node yarn'
                sh 'docker run -e CI=true -v $JENKINS_INSTALL$PWD:/usr/src/app zenika/alpine-node yarn test'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker build -t local/application:${BRANCH_NAME} $JENKINS_INSTALL$PWD'
                sh 'docker-compose -p ${BRANCH_NAME}-demo up -d'
            }
        }
    }
}
