include Makefile.mk

b: cleanup build
build: wrapper
	./gradlew build test;
cleanup:
		if [ -f build/reports/problems/problems-report.html ]; then rm build/reports/problems/problems-report.html; fi;
wrapper:
	gradle wrapper
deps-plugins-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/pluginUpdatesOne.sh | bash -s -- $(PARAMS)
deps-java-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/javaUpdatesOne.sh | bash
deps-gradle-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/gradleUpdatesOne.sh | bash
deps-quick-update: deps-gradle-update deps-plugins-update deps-java-update
update-repo-prs:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/update-all-repo-prs.sh | bash
accept-prs:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/acceptPR.sh | bash
print-error-report:
	if [ -f build/reports/problems/problems-report.html ]; then cat build/reports/problems/problems-report.html; fi;