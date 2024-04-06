pipeline {
    agent {
        node {
            label "build-local"
        }
    }
    environment {
        WORKING_DIRECTORY = '/home/'
        GIT_CREDENTIALS_ID = 'github-creds'
        ENV = "dev"
    }

    stages {
        stage('GIT CHECKOUT product CODE') {
            steps {
                sh '''
            mkdir -p ${WORKING_DIRECTORY}/product-app
            '''
                dir("${WORKING_DIRECTORY}/product-app") {
                    git branch: "${PRODUCT_APP_BRANCH}",
                            credentialsId: "${GIT_CREDENTIALS_ID}",
                            url: 'git@github.com:barryallent/spring-product-app.git'
                }
            }
        }
        stage('GIT CHECKOUT INFRA CODE') {
            steps {
                sh '''
            mkdir -p ${WORKING_DIRECTORY}/infra
            '''
                dir("${WORKING_DIRECTORY}/infra") {
                    git branch: "${INFRA_BRANCH}",
                            credentialsId:"${GIT_CREDENTIALS_ID}",
                            url: 'git@github.com:barryallent/infra.git'
                }
            }
        }

        stage('build docker image if need') {
            steps {
                sh '''
            echo ${DOCKER_PASSWORD} | docker login --username barryallenat --password-stdin
            docker build --build-arg ENV=${ENV} -t barryallenat/spring-product-app:${ENV}-${BUILD_NUMBER} . --network host
            docker push barryallenat/spring-product-app:${ENV}-${BUILD_NUMBER}
            '''
            }
        }
    }

}