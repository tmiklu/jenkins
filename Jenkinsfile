// CODE_CHANGES = GetGitChanges()
pipeline {

  agent any
  parameters {
    choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
    booleanParam(name: 'executeTests', defaultValue: true, description: '')
    booleanParam(name: 'executeBuild', defaultValue: true, description: '')
  }
 
  stages {
  
    stage("build") {
 
      when {
        expression {
          params.executeBuild
        }
      }

      steps {
        echo 'building the application...'
        
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
