---
- project:
    name: bgpcep-silicon
    jobs:
      - "{project-name}-distribution-check-{stream}"
      - "{project-name}-maven-javadoc-jobs"
      - "{project-name}-rtd-jobs":
          build-node: centos7-builder-2c-2g
          project-pattern: bgpcep
          rtd-build-url: https://readthedocs.org/api/v2/webhook/odl-bgpcep/47576/
          rtd-token: dbe9d1aabbe8812a26b428908f6613c28e3191fc
      - odl-maven-jobs-jdk11
      - odl-maven-verify-jobs

    stream: silicon
    project: "bgpcep"
    project-name: "bgpcep"
    build-node: centos7-builder-8c-8g
    build-timeout: 120
    branch: "master"
    java-version: "openjdk11"
    mvn-settings: "bgpcep-settings"
    mvn-opts: "-Xmx2048m"
    dependencies: >
      odlparent-merge-{stream},
      yangtools-merge-{stream},
      controller-merge-{stream},
      mdsal-merge-{stream}
    email-upstream: "[bgpcep] [odlparent] [yangtools] [controller] [mdsal]"

    # Used by the release job
    staging-profile-id: 9427a05049030

- project:
    name: bgpcep-aluminium
    jobs:
      - "{project-name}-distribution-check-{stream}"
      - "{project-name}-maven-javadoc-jobs"
      - "{project-name}-rtd-jobs":
          build-node: centos7-builder-2c-2g
          project-pattern: bgpcep
          rtd-build-url: https://readthedocs.org/api/v2/webhook/odl-bgpcep/47576/
          rtd-token: dbe9d1aabbe8812a26b428908f6613c28e3191fc
      - odl-maven-jobs-jdk11
      - odl-maven-verify-jobs

    stream: aluminium
    project: "bgpcep"
    project-name: "bgpcep"
    build-node: centos7-builder-8c-8g
    build-timeout: 120
    branch: "stable/aluminium"
    java-version: "openjdk11"
    mvn-settings: "bgpcep-settings"
    mvn-opts: "-Xmx2048m"
    dependencies: >
      odlparent-merge-{stream},
      yangtools-merge-{stream},
      controller-merge-{stream},
      mdsal-merge-{stream}
    email-upstream: "[bgpcep] [odlparent] [yangtools] [controller] [mdsal]"

    # Used by the release job
    staging-profile-id: 9427a05049030

- project:
    name: bgpcep-magnesium
    jobs:
      - "{project-name}-distribution-check-{stream}"
      - "{project-name}-maven-javadoc-jobs"
      - "{project-name}-rtd-jobs":
          build-node: centos7-builder-2c-2g
          project-pattern: bgpcep
          rtd-build-url: https://readthedocs.org/api/v2/webhook/odl-bgpcep/47576/
          rtd-token: dbe9d1aabbe8812a26b428908f6613c28e3191fc
      - odl-maven-jobs-jdk11
      - odl-maven-verify-jobs

    stream: magnesium
    project: "bgpcep"
    project-name: "bgpcep"
    build-node: centos7-builder-8c-8g
    build-timeout: 120
    branch: "stable/magnesium"
    java-version: "openjdk11"
    mvn-settings: "bgpcep-settings"
    mvn-opts: "-Xmx2048m"
    dependencies: >
      odlparent-merge-{stream},
      yangtools-merge-{stream},
      controller-merge-{stream},
      mdsal-merge-{stream}
    email-upstream: "[bgpcep] [odlparent] [yangtools] [controller] [mdsal]"

    # Used by the release job
    staging-profile-id: 9427a05049030

- project:
    name: bgpcep-sonar
    jobs:
      - gerrit-maven-sonar:
          mvn-params: >
            -Dodl.jacoco.aggregateFile=$WORKSPACE/target/jacoco.exec
            -P!karaf
          sonar-mvn-goal: >
            jacoco:report -Djacoco.dataFile=$WORKSPACE/target/jacoco.exec
            sonar:sonar

    project: "bgpcep"
    project-name: "bgpcep"
    build-node: centos7-builder-8c-8g
    build-timeout: 120
    branch: "master"
    java-version: "openjdk11"
    mvn-settings: "bgpcep-settings"
    mvn-opts: "-Xmx1024m"
    sonarcloud: true
    sonarcloud-project-organization: "{sonarcloud_project_organization}"
    sonarcloud-api-token: "{sonarcloud_api_token}"
    sonarcloud-project-key: "{sonarcloud_project_organization}_{project-name}"

- project:
    name: bgpcep-info
    jobs:
      - gerrit-info-yaml-verify
    project: bgpcep
    project-name: bgpcep
    branch: master
    build-node: centos7-builder-2c-1g

- project:
    name: bgpcep-view
    views:
      - project-view
    project-name: bgpcep
