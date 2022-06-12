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
		git 'https://github.com/MaheshParde/JAVA-Test.git'
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
				sh "docker push maheshparde/E-Commerce-Spring-Boot"
				}
			}
		}
	}

}

}	
