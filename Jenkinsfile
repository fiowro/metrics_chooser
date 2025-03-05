pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/fiowro/metrics_chooser.git'
            }
        }
        
        stage('Build DEB') {
            steps {
                sh 'dpkg-buildpackage -b'
                
            }

            post {
                success {
                    archiveArtifacts '**/*.deb'
                }
            }
        }
    }
}

