ANSWER_1: The course-portal configuration failed to read because it doesn't have permission.
ANSWER_2: The file has octal permissions 600 (-rw-------), giving read and write access only to root, while group course-portal and others have no access. Since the service runs as the course-portal user, it relies on group permissions which it does not have.
ANSWER_3: 640
ANSWER_3_WHY: 400 leaves group access at 0 so permission is still denied, while 755 and 777 grant unnecessary execute permissions on a config file and expose read/write access to others.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Any local user or compromised process can modify or overwrite important configuration settings.
ANSWER_6: We can use the command systemctl status course-portal to check the active status of the service.
ANSWER_7_BRIDGE: component=configuration, detect=log monitoring, recover=right permissions, proof=an active running service
