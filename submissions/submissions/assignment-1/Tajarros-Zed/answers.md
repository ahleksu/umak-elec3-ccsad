ANSWER_1: The Course Materials Portal fails because it cannot read /etc/course-portal/portal.conf due to a permission denied error.
ANSWER_2: The file has mode 600: its owner, root, has read and write permissions (rw-), while its group, course-portal, and others have no permissions (---). The course-portal account belongs to the file's group but is not its owner, so it uses the group permissions and cannot read the file.
ANSWER_3: 640
ANSWER_3_WHY: 640 keeps root's read and write access, gives the course-portal group read access, and gives others no access. 400 still gives the group no read access, so it does not fix the problem. 755 unnecessarily allows others to read the configuration and adds execute permissions. 777 gives everyone read, write, and execute access, which is much more access than the service needs.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 allows anyone to write to the configuration file, so an unauthorized user could tamper with the portal's settings.
ANSWER_6: A successful request to the Course Materials Portal that displays the expected course materials, instead of the error page, would confirm that users can use the service again.
ANSWER_7_BRIDGE: component=application server, detect=error log monitoring, recover=a minimum permission correction, proof=a successful user request showing course materials
