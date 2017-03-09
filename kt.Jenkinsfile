node {
  stage('Checkout') {
    git url: 'https://github.com/crerwin/tf_pipeline.git'
  }
  stage('bundle install') {
    sh(script: 'bundle install --path ./gems')
  }
  stage('kitchen-terraform') {
    sh(script: 'bundle exec kitchen test')
  }
}
