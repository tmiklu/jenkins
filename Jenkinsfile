// CODE_CHANGES = GetGitChanges()
pipeline {

  agent any
  parameters {
    choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
    booleanParam(name: 'executeTests', defaultValue: true, description: '')
    booleanParam(name: 'executeBuild', defaultValue: false)
  }
 
  stages {
  
    stage("build") {
 
      steps {
        echo 'building the application...'
        
      }
      when {
        expression {
          params.executeBuild
        }
      }
    }
    
    stage("test") {

      when {
        expression {
          BRANCH_NAME == 'dev' || BRANCH_NAME == 'master'
        }
        
        expression {
          params.executeTests
        }
      }
      steps {
        echo "testing version ${VERSION}"
        echo 'testing the application...'
      }
    }
    
    stage("deploy") {
  
      steps {
        echo 'deploying the application...'
        echo "deploying version ${params.VERSION}"
   
      }
    }    
  }
}
