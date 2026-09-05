ANSWER_1: The Course Materials Portal service failed because it was denied permission to read its configuration file at /etc/course-portal/portal.conf.
ANSWER_2: The file mode -rw------- (600) grants read and write access only to the owner (root), while setting group and others to 0 (no access). Since course-portal is not root, it accesses the file via group permissions, which are set to no access.
ANSWER_3: 640
ANSWER_3_WHY: 400 keeps group access at 0 which fails to solve the issue, while 755 and 777 grant unnecessary execute and world-writable permissions that expose the file to unauthorized users.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Others gain write and execute access, allowing any user on the system to modify or delete sensitive configuration settings.
ANSWER_6: A successful HTTP 200 response from the web service or clean startup logs in app.log showing the service actively serving requests.
ANSWER_7_BRIDGE: component=configuration, detect=log monitoring, recover=automated remediation, proof=synthetic health checks