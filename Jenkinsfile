pipeline {
	agent any	
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/nidhi/Documents/Devops_Software/apache-maven-3.9.3/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/project2.war /home/nidhi/Documents/Devops_Software/apache-tomcat-9.0.76/webapps'

			}}
			stage('Docker build'){
		    steps {
			sh 'docker build -t nidhikashyap18/pipeline-image-1 .'
			}}
			stage('Container creation'){
		    steps {
			sh 'docker run -it -d --name=container-pipeline-1 nidhikashyap18/pipeline-image-1 /bin/bash'
			}}
		stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'nidhikashyap18', passwordVariable: 'Nidhi@1999')]) {
                        sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"
                    }
                    
                    // Tag the Docker image
                    sh 'docker tag pipeline-image-1 nidhikashyap18/pipeline-image-1'
                    
                    // Push the Docker image to Docker Hub
                    sh 'docker push nidhikashyap18/pipeline-image-1'
                }
            }
        }		

}}
