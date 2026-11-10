ANSWER_1: Only the owner has permission to read and write /etc/course-portal/portal.conf, 
group and others doesnt have permission for that file.
ANSWER_2: root is the file owner, which has read and write(rw-) permissions therefore the 
course-portal account cannot have owner permissions since its not root, Owner permissions can
read and write(rw-), Group has no permissions(---), Others has no permissions aswell(---), 
based on the id, group-portal isnt the file owner and is only a group member.
ANSWER_3: 640
ANSWER_3_WHY: 400 would only give the owner a read only permission which means the owner cannot 
modify the file and Groups wont be able to read it, 755 would give Group and Others execute 
permissions which they may execute unsafe script, 777 would give everyone, the Owner, Groups, 
and Others read, write, and execute permissions which could get messy since everyone has the 
freedom to do what they want to the file such as unsafe scripts, moving it to another location, 
and deletion.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Giving everyone read, write and execute permissions on your file can expose it to 
unauthorized data loss and security exploits.
ANSWER_6: Try to open the file again with the changed permissions then check the logs in 
/var/log/course-portal/app.log and verify if everything works correctly. There should be no 
permission denied error in that log file that got generated.
ANSWER_7_BRIDGE: component=<file permissions>, detect=<monitoring mechanisms>, 
recover=<restoring backups>, proof=<successful automated end-to-end tests>
