node {
    stage name: 'terraform plan'
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
    }

    if(apply) {
        stage name: 'terraform apply'
        unstash 'plan'
        sh 'terraform version'
    }
}
