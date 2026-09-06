ANSWER_1: The course-portal service was unable to access its configuration file due to a lack of sufficient permissions.

ANSWER_2: The file has permissions set to 600 (-rw-------), meaning only the root user can read or write to it. Because the group and other users have no access at all, and the service actually runs as the course-portal user rather than root, it fails since it lacks the group-level access it requires.

ANSWER_3: 640

ANSWER_3_WHY: Changing it to 400 wouldn't solve the problem either, since the group would still have no access. Meanwhile, 755 and 777 grant too much — they add an unnecessary execute permission for a config file and allow others to read or even write to it, creating a security risk.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: If permissions are too permissive, any user on the system — or any process that becomes compromised — could modify or overwrite the configuration file.

ANSWER_6: To verify whether the service is currently running, use the command systemctl status course-portal.

ANSWER_7_BRIDGE: component=configuration, detect=log monitoring, recover=right permissions, proof=an active running service
