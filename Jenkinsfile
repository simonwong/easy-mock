def IMG_NAME = 'easy_mock'
def CONTAINER_NAME = 'easy_mock'

pipeline {
  agent any

  stages {
    stage('Clear old container') {
      steps {
        script {
          try {
            sh "docker rm -f ${CONTAINER_NAME}"
          } catch (exc) {
            echo "Not Found container:${CONTAINER_NAME} "
            echo "${exc}"
          }
        }
      }
    }
    stage('Build') {
      steps {
        sh "docker build -t ${IMG_NAME} -f Dockerfile ."
        sh "docker run -d \
            -p 7300:7300 \
            -v /usr/local/easy-mock/upload:/code/public/upload \
            -v /usr/local/config_center/easy-mock:/code/config \
            --name ${CONTAINER_NAME} \
            ${IMG_NAME}"
      }
    }
  }

  post {
    success {
      echo 'success'
    }
    failure {
      echo 'fail'
    }
  }
}
