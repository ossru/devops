pipeline {
    agent any
    tools {
        jdk 'JAVA_HOME'
        maven 'M2_HOME'
    }
    stages {
        stage('GIT') {
            steps {
                git branch: 'master',
                url: 'https://github.com/hwafa/timesheetproject.git'
            }
        }
        stage('Compile Stage') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Sonar Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner';
                    withSonarQubeEnv('sonar') {
                        sh "${scannerHome}/bin/sonar-scanner \
                          -Dsonar.projectKey=timesheet \
                          -Dsonar.sources=src/main/java \
                          -Dsonar.java.binaries=target/classes"
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t yosserajlani_nids4_timesheet:1.0 .'
                }
            }
        }
    }
}
