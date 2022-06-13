pipeline {
  agent any
  tools {
    maven 'MAVEN_HOME-3.6.3'
  }
  
	environment{
	registry="maheshparde/E-Commerce-Spring-Boot"
	registryCredential='maheshparde'
	//dockerImage=''
	}
	
    //each branch has 1 job running at a time
  options {
    disableConcurrentBuilds()  
  }

stages{
	stage('Git') {
		steps{
		git 'https://github.com/MaheshParde/E-Commerce-Spring-Boot.git'
		}	
	}
   

    stage('Code Analysis') {
	    
	    tools{
	    jdk "jdk11"
	    }
      steps {
        script {
          scannerHome = tool 'SonarQubeScanner'
        }
        withSonarQubeEnv('sonarqube') {
          git 'https://github.com/MaheshParde/E-Commerce-Spring-Boot.git'
          sh  "mvn -Dspring.profiles.acitve=dev -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml clean verify sonar:sonar"
        }
      }
    }


	stage('docker Image'){
		steps{
			script{
		 	sh "docker build -t maheshparde/e-commerce-spring-boot ."	
			}
		}
	}
		
stage('Registring image') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				//dockerImage.push()
				sh "docker push maheshparde/e-commerce-spring-boot"
				}
			}
		}
	}

}

}	
