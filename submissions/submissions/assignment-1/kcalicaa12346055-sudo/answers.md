ANSWER_1: The Course Materials Portal failed because the course-portal service account was denied read access to /etc/course-portal/portal.conf.
ANSWER_2: The file mode -rw------- (600) gives read/write access only to owner root, while group course-portal has no permissions (---); because the service account is in the group and is not root, access is denied.
ANSWER_3: 640
ANSWER_3_WHY: Mode 400 keeps group access set to --- (denying read); modes 755 and 777 grant unnecessary execute bits and open public read/write permissions to all users.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Mode 777 grants write and execute rights to all users on the server, enabling unauthorized users or malicious processes to tamper with sensitive portal configuration.
ANSWER_6: Application log entries in /var/log/course-portal/app.log showing successful startup, or an HTTP 200 OK response when loading the portal in a browser.
ANSWER_7_BRIDGE: component=configuration access control, detect=automated log monitoring, recover=permission remediation scripts, proof=end-to-end HTTP health checks