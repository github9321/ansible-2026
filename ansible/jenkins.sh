pipeline {
    agent { label 'ansible01' }

    stages {
        stage('git-clone') {
            steps {
                echo 'clone'
                git branch: 'main', url: 'https://github.com/github9321/ansible-2026.git'
            }
        }
        stage('run-playbook ') {
            steps {
                echo 'ansible playbook'
                sh 'ansible-playbook -i ansible/all_vm httpd.yml'
            }
        }
    }
}
