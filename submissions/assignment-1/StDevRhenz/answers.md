```
ANSWER_1: The portal cannot read the portal.conf file because it does not have permission.
ANSWER_2: The permission is 600. Root can read and write the file, while the group and others have no access. The course-portal account belongs to the file's group, but the group has no read permission.
ANSWER_3: 640
ANSWER_3_WHY: 640 lets the course-portal group read the file while others still have no access. 400 does not allow the group to read it. 755 gives unnecessary read and execute access to others.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Using chmod 777 lets every user modify the configuration file, which can cause unauthorized changes.
ANSWER_6: Opening the portal and seeing the course materials load without an error proves that the service works again.
ANSWER_7_BRIDGE: component=file permissions, detect=monitoring and logs, recover=correct permission settings, proof=a successful portal request
```
