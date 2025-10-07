pipeline {
    agent any
    tools {
        maven 'MAVEN_HOME'  // Use the exact Maven tool name configured in Jenkins
    }
    stages {
        stage('git repo & clean') {
            steps {
                // If you want to delete existing project folder before cloning uncomment below:
                bat "rmdir /s /q xes"
                
                bat "git clone https://github.com/Eshwar0745/xes.git"
                bat "mvn clean -f xes"
            }
        }
        stage('install') {
            steps {
                bat "mvn install -f xes"
            }
        }
        stage('test') {
            steps {
                bat "mvn test -f xes"
            }
        }
        stage('package') {
            steps {
                bat "mvn package -f xes"
            }
        }
    }
}
