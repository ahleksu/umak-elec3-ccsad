ANSWER_1: The app is crashing because it's getting a "Permission denied" error when trying to read its config file at /etc/course-portal/portal.conf.
ANSWER_2: The file permissions are currently set to 600 (-rw-------), meaning only the owner (root) can read and write to it. Since the app runs under the course-portal group, it gets a 0 for access and can't read the file it needs to start.
ANSWER_3: 640
ANSWER_3_WHY: 400 still leaves the group with 0 access, so the app still fails. 755 gives out execute permissions we don't need. 777 is a huge security risk because it gives literally every user on the server full read/write/execute access.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It gives write access to "Others," meaning any random user on the system could modify or mess up the app's config file.
ANSWER_6: Checking the actual web browser to see if the portal loads properly, or checking the app.log to make sure it started up without any new errors.
ANSWER_7_BRIDGE: component=file system, detect=log monitoring, recover=automation scripts, proof=health checks
