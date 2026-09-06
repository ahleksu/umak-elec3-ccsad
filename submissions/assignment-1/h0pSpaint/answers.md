ANSWER_1: The Course Materials Portal fails because it cannot read /etc/course-portal/portal.conf (Permission denied).
ANSWER_2: The file is mode 600 (-rw-------): owner root can read/write, group course-portal and others have no access. The course-portal account is not the owner and its group has ---, so it cannot read portal.conf.
ANSWER_3: 640
ANSWER_3_WHY: 400 fails because group still has no read. 755 and 777 work but grant extra execute and/or world access. 640 is the smallest change that lets the course-portal group read the file.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 lets anyone on the system read, write, and execute the config, so an unauthorized user could tamper with or overwrite it.
ANSWER_6: The Course Materials Portal loads successfully for a user and the app log no longer shows Permission denied for portal.conf.
ANSWER_7_BRIDGE: component=file permissions on the portal config, detect=log monitoring and alerts, recover=a documented permission fix and service restart, proof=health checks or a successful user request
