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
                stash includes: '**/*.deb', name: 'debPackage'
            }
 
        }
        
        stage('Build RPM') {
            steps {
                sh 'rpmbuild --build-in-place --define "_topdir $(pwd)/rpm" --define "_sourcedir $(pwd)" -bb rpm/metrics-chooser.spec'
                unstash 'debPackage' 
                archiveArtifacts '**/*.rpm', '**/*.deb'
                }
        }
    }
}

