pipeline {
	agent any

	environment {
        DOCKER_REGISTRY = "nidhikashyap18"
        DOCKER_CREDENTIAL_ID = 'dockerhub_id'
        DOCKER_IMAGE_NAME = 'nidhikashyap18/pipeline-image1'
    }
	
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
			sh 'docker build -t nidhikashyap18/pipeline-image1 .'
			}}
			stage('Container creation'){
		    steps {
			sh 'docker run -it -d --name=container-pipeline2 nidhikashyap18/pipeline-image1 /bin/bash'
			}}
			stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry(nidhikashyap18, dockerhub_id) {
                        def customImage = docker.build(nidhikashyap18/pipeline-image1)
                        customImage.push()
                    }
                }
            }
        }	

}}
