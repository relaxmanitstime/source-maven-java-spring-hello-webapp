pipeline {
  //agent any
  agent {
    label "jenkins-node"
  }
  options {
    ansiColor('xterm')
  }
  triggers {
    pollSCM('* * * * *')
  }
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main',
        url: 'https://github.com/relaxmanitstime/source-maven-java-spring-hello-webapp.git'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package -DskipTests=true'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Deploy') {
      steps {
        deploy adapters: [tomcat9(credentialsId: 'tomcat-manager',
                          url: 'http://3.38.176.180:8080/')], 
                          contextPath: 'hello-world',
                          war: 'target/hello-world.war'
      }
    }
  }
}