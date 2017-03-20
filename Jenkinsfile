node {
  stage('Checkout') {
    git url: 'https://github.com/crerwin/tf_pipeline.git'
  }
  stage('Clean Up') {
    if (fileExists("terraform.tfstate")) {
      sh "rm -f terraform.tfstate"
    }
    if (fileExists(".terraform/terraform.tfstate")) {
      sh "rm -f .terraform/terraform.tfstate"
    }
  }
  stage('terraform init') {
    //sh 'terraform remote config -backend=local -backend-config="path=/var/lib/jenkins/tfstate/terraform.tfstate"'
    sh 'terraform init -backend=true -get=true'
  }
  stage('terraform plan') {
    def planStatus = sh(script: 'terraform plan -out=plan.out -detailed-exitcode', returnStatus: true)
    println planStatus
    if (planStatus == 0) {
      currentBuild.result = 'SUCCESS'
    }
    if (planStatus == 1) {
      currentBuild.result = 'FAILURE'
    }
    if (planStatus == 2) {
      stash name: "plan", includes: "plan.out"
      try {
        input message: 'Apply plan?', ok: 'Apply'
        apply = true
      } catch (err) {
        apply = false
        currentBuild.result = 'UNSTABLE'
      }
      if(apply) {
        stage('terraform apply') {
          unstash 'plan'
          sh 'terraform apply plan.out'
        }
      }
    }
  }
}
