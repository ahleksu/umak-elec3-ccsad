ANSWER_1: The course-portal service couldn't read its configurations file because it lacked the needed permission.
ANSWER_2: The file's persmission are set to 600 (-rw-------), which only lets root read or write it. Since the group and everyone else have no access, and the service actually runs under the course-portal user(not root), it fails becauseu it needs group-level access it doesn't have.
ANSWER_3: 640
ANSWER_3_WHY: Setting it to 400 won't fix it either, since the group still has zero access. On the other hand, 755 and 777 give too much - they add execute permission (not needed for a config file) and let others read or even write to it, which is a security risk.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: With overly open permissions, any user on the system, or any process that gets compromised, could change or overwrite the configuration file.
ANSWER_6: To check if the service is currently running, use the command systemct1 status course-portal.
ANSWER_7_BRIDGE: component=configuration, detect=log monitoring, recover=right permissions, proof=an active running service
