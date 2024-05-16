pipeline {
    agent none
    stages {
        stage('packaging') {
            agent {
                docker {
                    image 'maven:3.9.3-eclipse-temurin-17-focal'
                    args '-u root -v /tmp/m2:/root/.m2 -w ${WORKSPACE}'
                }
            }
            steps {
                sh "mvn clean package -DskipTests"
            }
        }

        // stage('building-docker-image') {
        //     steps {
        //         script{
        //             app = docker.build('sanket0414/selenium-docker-integration' , "-f ${WORKSPACE}/Dockerfile .")
        //         }
        //     }
        // }

        // stage('pushing-docker-image') {
        //     steps {
        //         script{
        //             docker.withRegistry('', 'DOCKER_HUB_CRED') {
        //             app.push('latest')
        //             }
        //         }
        //     }
        // }
}

}