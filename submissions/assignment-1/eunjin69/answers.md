ANSWER_1: The course portal application failed because it was denied permission to read the portal.conf file.
ANSWER_2: The course-portal account cannot read the file because its group permissions are set to none. The owner (root) has read and write (rw-), the group (course-portal) has no permissions (---), and others have no permissions (---).
ANSWER_3: 640 
ANSWER_3_WHY: 400 is wrong because it leaves the group with no access. 755 and 777 are wrong because they provide unnecessary execute and write permissions, meaning they are not the smallest fix.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Using chmod 777 gives every user on the system the ability to write to or modify the configuration file, which is a major security risk.
ANSWER_6: Opening the course portal in a web browser and seeing the web page load successfully without any errors.
ANSWER_7_BRIDGE: component=file permissions, detect=health checks, recover=automated scripts, proof=end-to-end user tests