pipeline {
    agent any
    stages {
        stage('packaging') {
            steps {
                sh "mvn clean package -DskipTests"
            }
        }

        stage('building-docker-image') {
            steps {
                script{
                    app = docker.build('sanket0414/selenium-docker-integration' , "-f ${WORKSPACE}/Dockerfile .")
                }
            }
        }

        stage('pushing-docker-image') {
            steps {
                script{
                    docker.withRegistry('', 'DOCKER_HUB_CRED') {
                    app.push('latest')
                    }
                }
            }
        }
}

}