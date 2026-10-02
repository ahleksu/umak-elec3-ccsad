ANSWER_1: The course-portal service failed to start because the system blocked it from reading the /etc/course-portal/portal.conf file.
ANSWER_2: The file's permission mode is 600, which grants read and write privileges exclusively to the owner, while the group and others are both assigned 0 (no access).
ANSWER_3: 640
ANSWER_3_WHY: The 400 option fails to grant the necessary group access, while 755 unnecessarily allows the entire system to read and execute the file. Finally, 777 creates a massive security flaw by letting any user write to or execute the file.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It grants global write permissions, meaning any compromised user account on the entire server could tamper with or delete the configuration file.
ANSWER_6: Successfully loading the portal's main web page in a browser without receiving a server error.
ANSWER_7_BRIDGE: component=system configuration, detect=service monitoring, recover=infrastructure as code, proof=automated health checks