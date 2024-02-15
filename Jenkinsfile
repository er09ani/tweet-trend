/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent {
        node {
            label 'maven'
        }
    }
    environment {
        PATH = "/opt/apache-maven-3.9.6/bin:$PATH"
    }
    stages {
        stage('debug'){
            steps {
                echo '----------- debug started ----------'
            }
        }
        stage('build') {
            steps {
                echo '----------- build started ----------'
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                echo '----------- build complted ----------'
            }
        }
        stage('test') {
            steps {
                echo '----------- unit test started ----------'
                sh 'mvn surefire-report:report'
                echo '----------- unit test Complted ----------'
            }
        }
        stage('SonarQube analysis') {
            environment {
                scannerHome = tool 'ani-sonar-scanner'
            }
            steps{
                echo '----------- starting sonar analysis stage ----------'
                /* groovylint-disable-next-line LineLength */
                /* groovylint-disable-next-line LineLength */
                withSonarQubeEnv('ani-sonar-server') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner"
                }
                echo '----------- ending sonar analysis stage ----------'
            }
        }
    }
}
