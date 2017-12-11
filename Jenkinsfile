pipeline {
    agent any

    stages {
        stage('lint') {
            steps {
                sh 'echo $BRANCH_NAME'
                sh 'docker run -v $JENKINS_INSTALL/jenkins/workspace/zenbox-docker-app:/usr/src/app zenika/alpine-node yarn'
                sh 'docker run -e CI=true -v $JENKINS_INSTALL/jenkins/workspace/zenbox-docker-app:/usr/src/app zenika/alpine-node yarn test'
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
